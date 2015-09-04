class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :season
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :registraiton_form_url
      t.integer :delegation_fee
      t.date :position_paper_deadline
      t.text :welcome_letter      
      t.references :category
      t.boolean :is_active, default: true
      t.timestamps null: false
    end
  end
end
