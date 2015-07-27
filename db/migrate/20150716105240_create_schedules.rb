class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.date :date
      t.references :category
      t.boolean :is_active
      
      t.timestamps null: false
    end
  end
end
