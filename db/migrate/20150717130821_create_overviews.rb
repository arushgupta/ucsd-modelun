class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :session
      t.integer :year
      t.date :date
      t.string :location
      t.integer :delegation_fee
      t.integer :early_fee
      t.integer :regular_fee
      t.integer :late_fee
      t.integer :number
      t.references :category
      
      t.timestamps null: false
    end
  end
end
