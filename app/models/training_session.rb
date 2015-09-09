class TrainingSession < ActiveRecord::Base
  
  belongs_to :category
  
  attr_accessor :committee_image_url
  attr_accessor :topic_image_url
  mount_uploader :committee_image_url, ImageUploader
  mount_uploader :topic_image_url, ImageUploader
  mount_uploader :topic_guide_url, FileUploader
  validates :committee_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :topic_name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :topic_description, :presence => true, length: { maximum: 350}
  validates :date,presence: true
  validate :date_validation
  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
  validates :topic_image_url,:presence =>true
  validates :committee_image_url,:presence =>true
  validate :date_validation1
  validate :date_validation
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  def date_validation
    if end_date < start_date
      errors[:end_date] << "cannot be before the start date"
      return false
    else
      return true
    end
  end 

  def date_validation1
    if start_date < Date.today
      errors[:start_date] << "cannot be before the today date"
      return false
    else
      return true
    end
  end 

  def date_validation
    if date < Date.today
      errors[:date] << "cannot be before the today date"
      return false
    else
      return true
    end
  end  
end
