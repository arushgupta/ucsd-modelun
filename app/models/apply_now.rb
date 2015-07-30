class ApplyNow < ActiveRecord::Base

	belongs_to :category

	validates :headline, presence: true, :format => { :with => /\A[a-zA-Z\s\.',:(){}_\-]+\z/}, length: { maximum: 50 }
    validates :button_text, length: { maximum: 15 }
end
