class Category < ActiveRecord::Base

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
