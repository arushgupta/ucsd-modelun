class Schedule < ActiveRecord::Base
	belongs_to :conference
	has_many :events
end
