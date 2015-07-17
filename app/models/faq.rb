class Faq < ActiveRecord::Base
	belongs_to :conference
	has_many :questions

	accepts_nested_attributes_for :questions
end
