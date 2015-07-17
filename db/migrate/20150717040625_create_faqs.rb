class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :name
      t.references :conference
      t.timestamps null: false
    end
  end
end
