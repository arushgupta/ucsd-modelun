class CreateSecretariats < ActiveRecord::Migration
  def change
    create_table :secretariats do |t|
      t.string :position
      t.string :name
      t.string :college
      t.string :major
      t.string :email
      t.string :fb_url
      t.string :tw_url
      t.string :in_url
      t.string :website_url
      t.text :description
      t.string :image_url
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
