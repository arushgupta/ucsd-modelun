class Speaker < ActiveRecord::Base
  
  belongs_to :category

  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  validates :category, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100}
  validates :panel, presence: true, format: { with: /\A[a-zA-Z0-9\s\-]+\z/}, length: { maximum: 100}
  validates :description, presence: true, length: { maximum: 760 }
  validates :image_url, presence: true
end
