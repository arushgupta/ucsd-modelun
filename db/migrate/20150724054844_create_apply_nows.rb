class CreateApplyNows < ActiveRecord::Migration
  def change
    create_table :apply_nows do |t|
      t.text :title
      t.string :button_url
      t.string :button_text
      t.timestamps null: false
    end
  end
end
