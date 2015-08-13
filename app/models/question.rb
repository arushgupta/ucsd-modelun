class Question < ActiveRecord::Base
	
	belongs_to :faq
	
	validates :question,  presence: true, length: { maximum: 200 }
    validates :answer,  presence: true, length: { maximum: 500 }
def display_name
   "#{id}"
end 
end
