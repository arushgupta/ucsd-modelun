class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :is_deleted
      t.references :category
      
      t.timestamps null: false
    end
  end
end
