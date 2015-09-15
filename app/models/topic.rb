class Topic < ActiveRecord::Base

  belongs_to :committee
  
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  validates :order_id, presence: true
  validates :topic_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 750 }
  validates :image_url, presence: true
end
