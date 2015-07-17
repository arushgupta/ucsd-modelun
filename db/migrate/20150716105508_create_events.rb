class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :activity
      t.string :place
      t.datetime :datetime
      t.time :time_start
      t.time :time_end
      t.references :schedule
      
      t.timestamps null: false
    end
  end
end
