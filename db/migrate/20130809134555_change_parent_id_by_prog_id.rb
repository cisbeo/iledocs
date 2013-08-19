class ChangeParentIdByProgId < ActiveRecord::Migration
  def change
    rename_column :documents, :parent_id, :prog_id
  end
end

