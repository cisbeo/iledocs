class Comment < ActiveRecord::Base
  attr_accessible :text


  belongs_to :document


  include Tire::Model::Search
  include Tire::Model::Callbacks

end
