class TrainingSession < ActiveRecord::Base
  
  belongs_to :category
  
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  mount_uploader :topic_guide_url, FileUploader
end
