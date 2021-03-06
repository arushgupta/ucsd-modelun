class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :deadline_info
      t.date :date
      t.integer :phase_id
      t.integer :delegate_fee
      t.integer :delegation_fee
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
