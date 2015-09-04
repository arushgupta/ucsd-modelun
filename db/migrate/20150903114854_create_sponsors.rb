class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :logo_url
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
