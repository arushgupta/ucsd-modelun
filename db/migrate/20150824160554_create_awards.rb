class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :award
      t.integer :award_count
      t.references :travel_conference
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
