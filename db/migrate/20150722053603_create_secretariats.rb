class CreateSecretariats < ActiveRecord::Migration
  def change
    create_table :secretariats do |t|
      t.string :position
      t.string :name
      t.string :college
      t.string :major
      t.text :description
      t.string :image_url
      t.references :category
      t.boolean :is_active, :default => true
      
      t.timestamps null: false
    end
  end
end
