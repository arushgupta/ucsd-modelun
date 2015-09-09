class TrainingSession < ActiveRecord::Base
  
  belongs_to :category
  
  attr_accessor :committee_image_url
  attr_accessor :topic_image_url
  mount_uploader :committee_image_url, ImageUploader
  mount_uploader :topic_image_url, ImageUploader
  mount_uploader :topic_guide_url, FileUploader
  validates :committee_name, presence: true, length: { maximum: 100 }
  validates :topic_name, presence: true, length: { maximum: 100 }
  validates :topic_description, presence: true, length: { maximum: 350 }
  validates :date, presence: true
  validate :date_validation
  validates :location, presence: true, format: { with: /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/}, length: { maximum: 100}
  validates :topic_image_url, presence: true
  validates :committee_image_url, presence: true
  validate :date_validation
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  def date_validation
    if end_time < start_time
      errors[:end_date] << "End Time cannot be set to a time before the start time."
      return false
    else
      return true
    end
  end 

  def date_validation
    if date < Date.today
      errors[:date] << "Date cannot be set to a past date."
      return false
    else
      return true
    end
  end  
end
