class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :subheading
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
