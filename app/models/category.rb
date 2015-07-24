class Category < ActiveRecord::Base
 has_many :pages
 has_many :categories #, class_name: "Category",
 #                      #    foreign_key: "category_id"
 belongs_to :category #, class_name: "Category"
 has_many :overviews
 has_many :deadlines
 has_many :schedules
 has_many :faqs
 
 validates :name, presence: true, length: { maximum: 50 }



 validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
 
end
