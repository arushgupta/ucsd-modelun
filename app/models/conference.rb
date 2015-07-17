class Conference < ActiveRecord::Base
	belongs_to :branch
	has_many :deadlines
	has_many :schedules
	has_many :faq
	validates :year, presence: true, length: { maximum: 4 }
def to_s
  session
end
end
