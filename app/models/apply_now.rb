class ApplyNow < ActiveRecord::Base
	belongs_to :category
	validates :title,:presence => true, :format => { :with => /\A[a-zA-Z\-]+\z/},length: { maximum: 50 }
    validates :button_text,:format => { :with => /\A[a-zA-Z\-]+\z/},length: { maximum: 15 }
end
