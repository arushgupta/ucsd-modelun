class Committee < ActiveRecord::Base

  has_many :topics
  belongs_to :category

  # attr_accessor :topic_guide_url
  mount_uploader :topic_guide_url, FileUploader
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  
  validates :order, presence: true, uniqueness: true
  validates :committee_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :chair, presence: true, length: { maximum: 100 }
  validates :vice_chair, presence: true, length: { maximum: 100 }
end
