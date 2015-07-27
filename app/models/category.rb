class Category < ActiveRecord::Base
<<<<<<< HEAD
 has_many :pages
 has_many :categories #, class_name: "Category",
 #                      #    foreign_key: "category_id"
 belongs_to :category #, class_name: "Category"
 has_many :overviews
 has_many :deadlines
 has_many :schedules
 has_many :faqs
 has_many :travel_conferences
 
 validates :name, presence: true, length: { maximum: 50 }

=======
>>>>>>> 21042250126208e6aced40c9c7a6e818c45d77a6

  has_many :pages
  has_many :categories
  has_many :overviews
  has_many :deadlines
  has_many :schedules
  has_many :faqs
  has_many :speakers
  has_many :committees
  has_many :travel_conferences
  belongs_to :category

 validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
 
end
