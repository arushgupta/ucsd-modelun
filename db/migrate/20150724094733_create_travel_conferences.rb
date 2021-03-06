class CreateTravelConferences < ActiveRecord::Migration
  def change
    create_table :travel_conferences do |t|
      t.string :name
      t.string :short_name
      t.string :season
      t.integer :year
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :host
      t.string :application_url
      t.string :travel_team_image_url
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
