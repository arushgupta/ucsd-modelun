class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :activity
      t.string :place
      t.time :start_time
      t.time :end_time
      t.boolean :is_active
      t.references :schedule
      
      t.timestamps null: false
    end
  end
end
