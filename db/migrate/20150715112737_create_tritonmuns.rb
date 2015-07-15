class CreateTritonmuns < ActiveRecord::Migration
  def change
    create_table :tritonmuns do |t|
      t.string :season
      t.integer :number
      t.integer :year
      t.string :date
      t.string :location
      t.integer :early_price
      t.integer :normal_price
      t.integer :late_price
      t.string :early_date
      t.string :normal_date
      t.string :late_date
      t.integer :delegation_fee

      t.timestamps null: false
    end
  end
end
