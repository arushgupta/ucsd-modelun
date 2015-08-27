class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :major
      t.string :email
      t.string :image_url
      t.text :bio
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
