class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :subheading
      t.references :category
      t.boolean :is_active, default: true
      t.string :slug
      
      t.timestamps null: false
    end
    add_index :categories, :slug
  end
end
