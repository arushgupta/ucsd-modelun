class CreateOverview < ActiveRecord::Migration
  def change
    create_table :overview do |t|
      t.string :session
      t.integer :year
      t.date :date
      t.text :location
      t.integer :delegation_fee
      t.integer :early
      t.integer :regular
      t.integer :late
      t.integer :number
      t.string :reg_url
      t.references :category

      t.timestamps null: false
    end
  end
end
