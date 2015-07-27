class Event < ActiveRecord::Base
	belongs_to :schedule
	# validates :date,presence: true
	validates :start_time,presence: true
	validates :end_time,presence: true
	validates :activity,presence: true
end
