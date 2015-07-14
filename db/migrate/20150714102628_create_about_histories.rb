class CreateAboutHistories < ActiveRecord::Migration
  def change
    create_table :about_histories do |t|
      t.string :year
      t.string :description

      t.timestamps null: false
    end
  end
end
