class Event < ActiveRecord::Base
	belongs_to :schedule
	validates :date,presence: true
	validates :time_strat,presence: true
	validates :time_end,presence: true
	validates :activity,presence: true
end
