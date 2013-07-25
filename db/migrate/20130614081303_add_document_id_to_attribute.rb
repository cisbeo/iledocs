class AddDocumentIdToAttribute < ActiveRecord::Migration
  def change
    add_column :attributes, :document_id, :integer
 
  end
end
