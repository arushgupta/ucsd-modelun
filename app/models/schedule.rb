class Schedule < ActiveRecord::Base
	belongs_to :category
	has_many :events
	validates :name,  presence: true, length: { maximum: 100 }, uniqueness: {scope: :category,
	                       message: "should be one per category"}
    validates :category,presence: true
    validates :date,presence: true
end
