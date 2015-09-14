class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :apply_nows
  has_many :awards
  # has_many :categories
  has_many :committees
  has_many :deadlines
  has_many :faqs
  has_many :home_galleries
  has_many :overviews
  has_many :pages
  has_many :schedules
  has_many :secretariats
  has_many :speakers
  has_many :travel_conferences
  has_many :training_sessions
  has_many :icons
  has_many :alumnis
  has_many :sponsors
  belongs_to :category
  has_many :categories, class: "Category", foreign_key: "category_id"


  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
 
end
