class CreateTrainingSessions < ActiveRecord::Migration
  def change
    create_table :training_sessions do |t|
      t.date :date
      t.string :committee_name
      t.string :topic_name
      t.string :topic_description
      t.string :location
      t.string :topic_image_url
      t.string :committee_image_url
      t.string :topic_guide_url
      t.time :start_time
      t.time :end_time
      t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
