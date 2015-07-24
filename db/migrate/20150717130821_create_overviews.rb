class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :session
      t.integer :year
      t.date :date
      t.string :location
      t.references :category
      
      t.timestamps null: false
    end
  end
end
