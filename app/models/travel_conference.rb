class TravelConference < ActiveRecord::Base

	  belongs_to :category
	  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
      validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
      validates :short_name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
      validate :date_validation
def date_validation
  if :end_date < :start_date
    errors[:end_date] << "cannot be before the start date"
    return false
  else
    return true
  end
end  
end
