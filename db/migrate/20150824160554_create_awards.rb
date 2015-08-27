class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :award_name
      t.string :award_recipient
      t.integer :award_count, default: 1
      t.references :travel_conference
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
