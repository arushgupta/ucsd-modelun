class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :category_id
      t.string :name
      t.string :summary
      t.text :content
      t.text :meta_keywords
      t.string :meta_title
      t.integer :page_id
      t.boolean :is_deleted

      t.timestamps null: false
    end
  end
end
