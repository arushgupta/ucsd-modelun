class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :panel
      t.string :name
      t.text :description
      t.string :image_url
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
