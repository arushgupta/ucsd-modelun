class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :order
      t.string :topic
      t.string :image_url
      t.text :description
      t.references :committee
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
