class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :session
      t.integer :year
      t.date :date
      t.string :location
<<<<<<< HEAD
      t.integer :number
      t.boolean :is_active
=======
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
      t.references :category
      
      t.timestamps null: false
    end
  end
end
