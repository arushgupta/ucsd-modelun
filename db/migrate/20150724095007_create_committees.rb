class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.integer :order
      t.string :committee
      t.string :topic
      t.string :chair
      t.string :vice_chair
      t.string :string
      t.string :image
      t.text :description
      t.string :topic_guide
      t.boolean :is_active
      t.references :category

      t.timestamps null: false
    end
  end
end
