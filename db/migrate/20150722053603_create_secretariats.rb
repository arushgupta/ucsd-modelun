class CreateSecretariats < ActiveRecord::Migration
  def change
    create_table :secretariats do |t|
      t.string :position
      t.string :name
      t.string :college
      t.string :major
      t.string :description
      t.string :image
      t.boolean :is_active
      
      t.timestamps null: false
    end
  end
end
