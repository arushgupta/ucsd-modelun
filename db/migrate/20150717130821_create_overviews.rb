class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :session
      t.integer :year
      t.date :date
      t.string :location
      t.integer :number
      t.references :category
      
      t.timestamps null: false
    end
  end
end
