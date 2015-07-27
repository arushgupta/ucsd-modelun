class CreateApplyNows < ActiveRecord::Migration
  def change
    create_table :apply_nows do |t|
      t.string :title
      t.string :button_url
      t.string :button_text
      t.references :category
      t.boolean :is_active, :default => true
      
      t.timestamps null: false
    end
  end
end
