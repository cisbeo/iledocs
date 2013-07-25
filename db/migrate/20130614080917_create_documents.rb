class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :doctype
      t.string :status

      t.timestamps
    end
  end
end
