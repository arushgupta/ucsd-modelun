class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.boolean :is_active
      t.references :faq      
      
      t.timestamps null: false
    end
  end
end
