class Link < ActiveRecord::Base
  attr_accessible :from_id, :to_id, :ancestor, :child

  belongs_to :ancestor,  :foreign_key => "from_id", :class_name => "Document"
  belongs_to :child,  :foreign_key => "to_id", :class_name => "Document"

end
