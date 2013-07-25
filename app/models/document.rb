class Document < ActiveRecord::Base
  attr_accessible :doctype, :name, :status, :library, :srcfile, :member

  has_many :tags
  has_many :comments

  has_many :childs, :class_name => "Document", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Document"

include Tire::Model::Search
include Tire::Model::Callbacks

  def self.search(params)
  tire.search(load: true) do
    query { string params[:query], default_operator: "AND" } if params[:query].present?
    
  end
end


  def to_indexed_json
    to_json(methods: [:descriptions])
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

def authors
      self.tags.where("name like ?", 'author%')
end

def deprecated?
   self.tags.where("name  = ?", 'deprecated')
end

def export?
  self.tags.where("name = ?", 'exported')
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

def revs 
  self.tags.where("name like ?", 'rev%')
end

end
