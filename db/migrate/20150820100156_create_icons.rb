class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
    	t.string :overview_icon
    	t.string :schedule_icon
    	t.string :committee_icon
    	t.string :speaker_icon
    	t.string :fee_icon
    	t.string :faq_icon
      t.string :training_session_icon
      t.string :travel_conferences_icon
      t.string :awards_icon
      t.string :alumni_icon
      t.string :galleries_icon
      t.string :secretariats_icon
      t.string :history_icon
    	t.references :category
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
