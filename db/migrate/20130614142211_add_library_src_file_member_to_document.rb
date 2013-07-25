class AddLibrarySrcFileMemberToDocument < ActiveRecord::Migration
  def change
     add_column :documents, :libray, :string
     add_column :documents, :srcfile, :string
     add_column :documents, :member, :string

  end
end
