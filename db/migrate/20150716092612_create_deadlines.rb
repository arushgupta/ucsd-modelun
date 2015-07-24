class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :text
      t.references :category
      t.date :date
      t.integer :phase_id
      t.string :fee
      t.boolean :is_active
      
      t.timestamps null: false
    end
  end
end
