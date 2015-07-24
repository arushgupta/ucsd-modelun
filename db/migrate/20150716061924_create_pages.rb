class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :summary
      t.text :content
      t.text :meta_keywords
      t.string :meta_title
      t.boolean :is_active
      t.references :category
      
      t.timestamps null: false
    end
  end
end
