class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :year
      t.text :description
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
