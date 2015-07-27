class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :text
      t.date :date
      t.integer :phase_id
      t.string :fee
      t.references :category
      t.boolean :is_active, :default => true
      
      t.timestamps null: false
    end
  end
end
