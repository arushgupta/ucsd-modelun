class Alumni < ActiveRecord::Base

  belongs_to :category
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
end
