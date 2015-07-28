class Faq < ActiveRecord::Base
	
	belongs_to :category
	has_many :questions

	accepts_nested_attributes_for :questions
	validates :name,  presence: true, length: { maximum: 100 }, uniqueness: {scope: :category,
	                       message: "should be one per category"}
	validates :category,presence: true
end
