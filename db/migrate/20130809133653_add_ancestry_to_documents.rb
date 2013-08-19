class AddAncestryToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :ancestry, :string
    add_index :documents, :ancestry
  end

  def self.down
    remove_index :documents, :ancestry
    remove_column :documents, :ancestry
  end
end
