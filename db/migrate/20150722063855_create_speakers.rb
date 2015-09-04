class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :panel
      t.string :name
      t.string :fb_url
      t.string :tw_url
      t.string :in_url
      t.string :website_url
      t.text :description
      t.string :image_url
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
