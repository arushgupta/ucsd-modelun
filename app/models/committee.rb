class Committee < ActiveRecord::Base

  has_many :topics
  belongs_to :category

  attr_accessor :topic_guide_url
  mount_uploader :topic_guide_url, FileUploader
end
