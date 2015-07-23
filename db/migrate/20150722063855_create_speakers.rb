class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :panel
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
