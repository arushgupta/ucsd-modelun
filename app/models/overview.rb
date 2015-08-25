class Overview < ActiveRecord::Base
  
  belongs_to :category
  has_many :deadlines
  has_many :schedules
  has_many :faqs

  validates :season, presence: true
  validates :category,presence: true
  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
  validate :date_validation1
  validate :date_validation
  
  def display_name
    "#{category.name}_#{season}"
  end
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

  def to_s
    season
  end
end
