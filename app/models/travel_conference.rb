class TravelConference < ActiveRecord::Base

	  belongs_to :category
    has_many :awards
    
    validates :category,presence: true
	  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
    validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
    validates :short_name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
    validate :date_validation

  def display_name
  "#{category.name}_#{name}"
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
end
