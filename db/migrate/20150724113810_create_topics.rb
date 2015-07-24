class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :order
      t.string :topic
      t.string :image
      t.text :description
      t.boolean :is_active
      t.references :committee

      t.timestamps null: false
    end
  end
end
