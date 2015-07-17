class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.references :faq
      t.timestamps null: false
    end
  end
end
