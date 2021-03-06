class TravelConference < ActiveRecord::Base

	belongs_to :category
  has_many :awards
    
  attr_accessor :travel_team_image_url
  mount_uploader :travel_team_image_url, ImageUploader
  validates :category, presence: true
	validates :location, presence: true, format: { with: /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/}, length: { maximum: 100}
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100}
  validates :short_name, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100}
  validate :date_validation

  def display_name
  "#{category.name}_#{name}"
  end
  
  def date_validation
    if end_date < start_date
      errors[:end_date] << "End Date cannot be set to a past date."
      return false
    else
      return true
    end
  end
end
