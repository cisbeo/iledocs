require 'csv'

class CsvParser

  include Tire::Model::Search
include Tire::Model::Callbacks
  def self.parse


  	CSV.foreach("./echange/in/ILEDBASE-program-UTF-8.csv") do |row|

  		current_document = Document.new(:library => row[0], :srcfile => row[1], 
  			:member => row[2], :name => row[4], :doctype => row[3])
  		current_document.tags << Tag.new(:name => row[5], :value => row[6])
        #puts current_document.attributes.to_s
        if Document.find_by_name(row[4])
        	current_document = Document.find_by_name(row[4])
        	current_document.tags << Tag.new(:name => row[5], :value => row[6])
        end

        current_document.save
  	end

  	CSV.foreach("./echange/in/ILEDBASE-procedure-UTF-8.csv") do |row|

  		current_document = Document.new(:library => row[0], :srcfile => row[1], 
  			:member => row[2], :name => row[4], :doctype => row[3])
  		current_document.tags << Tag.new(:name => row[5], :value => row[6])
        #puts current_document.attributes.to_s
        if Document.find_by_name(row[4])
        	current_document = Document.find_by_name(row[4])
        	current_document.tags << Tag.new(:name => row[5], :value => row[6])
        end

        current_document.parent = Document.find_by_member(row[2])
        current_document.save
  	end


  end
end




