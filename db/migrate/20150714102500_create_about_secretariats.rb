class CreateAboutSecretariats < ActiveRecord::Migration
  def change
    create_table :about_secretariats do |t|
      t.string :position
      t.string :name
      t.string :college
      t.string :major
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
