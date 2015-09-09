class ApplyNow < ActiveRecord::Base

	belongs_to :category

	validates :headline, presence: true, length: { maximum: 50 }
    validates :button_text, length: { maximum: 15 }
    validates :button_url, presence: true
end
