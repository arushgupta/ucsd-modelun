class Event < ActiveRecord::Base
	
	belongs_to :schedule
	# validates :date,presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :activity, presence: true
	validate :time_validation
   
  def time_validation
    if end_time < start_time
      errors[:end_time] << "End Time cannot be set to a time before the start time."
      return false
    else
      return true
    end
  end 
  def display_name
   "#{id}"
  end 
end
