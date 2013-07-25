class Tag < ActiveRecord::Base
  attr_accessible :name, :value

    belongs_to :document


include Tire::Model::Search
include Tire::Model::Callbacks
end
