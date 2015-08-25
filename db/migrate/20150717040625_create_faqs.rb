class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :name
      t.references :category
      t.boolean :is_active, default: true
      
      t.timestamps null: false
    end
  end
end
