class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :summary
      t.text :content
      t.text :meta_keywords
      t.string :meta_title
      t.references :category      
      t.boolean :is_active, :default => true
      
      t.timestamps null: false
    end
  end
end
