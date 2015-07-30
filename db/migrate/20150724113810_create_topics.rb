class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :order
      t.string :topic_name
      t.string :image_url
      t.text :description
      t.references :committee
      t.boolean :is_active, :default => true

      t.timestamps null: false
    end
  end
end
