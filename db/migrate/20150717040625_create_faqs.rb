class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :name
      t.references :category
      
      t.timestamps null: false
    end
  end
end
