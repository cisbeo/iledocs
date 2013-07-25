class ChangeColumLibrayToLibraryInDocument2 < ActiveRecord::Migration
  def change
  	     rename_column :documents, :libray, :library
  end
end
