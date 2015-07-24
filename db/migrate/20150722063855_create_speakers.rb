class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :panel
      t.string :name
      t.text :description
      t.boolean :is_active
      t.references :category
      
      t.timestamps null: false
    end
  end
end
