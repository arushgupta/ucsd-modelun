class Event < ActiveRecord::Base
	belongs_to :schedule
	# validates :date,presence: true
	validates :start_time,presence: true
	validates :end_time,presence: true
	validates :activity,presence: true
	 validate :time_validation
def time_validation
  if :end_time < :start_time
    errors[:end_time] << "cannot be before the start time"
    return false
  else
    return true
  end
end  
end
