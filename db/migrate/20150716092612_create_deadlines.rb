class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :text
      t.references :category
      t.datetime :date
      
      t.timestamps null: false
    end
  end
end
