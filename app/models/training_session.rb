class TrainingSession < ActiveRecord::Base
  
  belongs_to :category
  
  attr_accessor :committee_image_url
  attr_accessor :topic_image_url
  mount_uploader :committee_image_url, ImageUploader
  mount_uploader :topic_image_url, ImageUploader
  mount_uploader :topic_guide_url, FileUploader
end
