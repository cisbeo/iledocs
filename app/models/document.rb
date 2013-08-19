class Document < ActiveRecord::Base
  attr_accessible :doctype, :name, :status, :library, :srcfile, :member

  has_many :tags
  has_many :comments
  
  has_many :procs, :class_name => "Document", :foreign_key => "prog_id"
  belongs_to :prog, :class_name => "Document"
  
  # Act as Direct Graph
  has_many :to_links, :foreign_key => "from_id" , :class_name => "Link"
  has_many :children , :through => :to_links

  has_many :from_links, :foreign_key => "to_id" , :class_name => "Link"
  has_many :ancestors , :through => :from_links


 
include Tire::Model::Search
include Tire::Model::Callbacks

  def self.search(params)
  tire.search(load: true, page: params[:page], per_page: 25) do |s|
    s.query { string params[:query], default_operator: "AND" } if params[:query].present?
    
  end
end


  def to_indexed_json
    to_json(methods: [:descriptions, :briefs])
  end
 
  def copybooks
    self.tags.where("name like ?", 'copy%')
  end

  def extpgms
    self.tags.where("name like ?", 'extpgm%')
  end

  def briefs
    self.tags.where("name like ?", 'brief%')
  end

  def descriptions
    self.tags.where("name like ?", 'desc%')
  end

  def desc
    self.tags.where("name like ?", 'desc%')
  end

  def parms
    self.tags.where("name like ?", 'parm%').order(:name)
  end

def author
  author = self.tags.where("name like ?", 'author%').first
  if author.nil?
    ''
  else
    author.value.strip
  end
end

def creation_date
  date = self.tags.where("name like ?", 'date%').first
  if date.nil?
    ''
  else
    date.value.strip
  end
end

def revs
      self.tags.where("name like ?", 'rev%')
end

def infos
      self.tags.where("name like ?", 'info%')
end

def warnings
      self.tags.where("name like ?", 'warning%')
end

def todos
      self.tags.where("name like ?", 'todo%')
end

def deprecated?
   !self.tags.where("name  = ?", 'deprecated').empty?
end

def export?
  !self.tags.where("name = ?", 'exported').empty?
end

def extpgms
      self.tags.where("name like ?", 'extpgm%')
end

def params
  @params ={}
  @tabparam = []
  self.tags.where("name like ?", "parm%").each do |s|
    @tabparam <<  [s.name.strip.last, s.value.strip]
  end

  @tabparam.each do |p|
    if @params.has_key?(p[0])
      @params[p[0]] << p[1]
    else
      @params[p[0]] = [p[1]]
    end
  end
  @params
end

def files_used
  self.children.where("doctype=?","FILE")
end

def prog_using
  self.ancestors.where("doctype=?","PROGRAM")
end

end
