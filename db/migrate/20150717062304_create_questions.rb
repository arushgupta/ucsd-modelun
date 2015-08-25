class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :answer
      t.references :faq
      t.boolean :is_active, default: true
            
      t.timestamps null: false
    end
  end
end
