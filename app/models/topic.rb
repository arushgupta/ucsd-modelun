class Topic < ActiveRecord::Base

  belongs_to :committee
  
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  validates :order, presence: true, uniqueness: true
  validates :topic, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, :presence => true, length: { maximum: 1000}
end
