class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.integer :order_id
      t.string :committee_name
      t.string :chair
      t.string :vice_chair
      t.string :topic_guide_url
      t.string :image_url
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
