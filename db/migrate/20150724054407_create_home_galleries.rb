class CreateHomeGalleries < ActiveRecord::Migration
  def change
    create_table :home_galleries do |t|
      t.string :image_url
      t.string :image_text
      t.string :button_url
      t.string :button_text
      t.string :title
      t.references :category
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
