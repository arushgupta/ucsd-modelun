class Faq < ActiveRecord::Base
	
	belongs_to :category
	has_many :questions

	accepts_nested_attributes_for :questions
	validates :name,  presence: true, length: { maximum: 100 }, uniqueness: {scope: :category,
	                       message: "Should be one per Category."}
	validates :category, presence: true
 def display_name
   "#{category.name}_#{name}"
 end
end
