class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :name
      t.date :date
      t.boolean :is_active
      t.references :category
      
      t.timestamps null: false
    end
  end
end
