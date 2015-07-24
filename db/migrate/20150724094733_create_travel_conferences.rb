class CreateTravelConferences < ActiveRecord::Migration
  def change
    create_table :travel_conferences do |t|
      t.string :name
      t.string :short_name
      t.string :session
      t.integer :year
      t.date :date
      t.string :location
      t.string :host
      t.references :category
      t.timestamps null: false
    end
  end
end
