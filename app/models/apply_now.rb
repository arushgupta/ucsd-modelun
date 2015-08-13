class ApplyNow < ActiveRecord::Base

	belongs_to :category
    
    attr_accessor :image_url
	mount_uploader :image_url, ImageUploader
	validates :headline, presence: true, length: { maximum: 50 }
    validates :button_text, length: { maximum: 15 }
    validates :button_url, presence: true
def display_name
  "#{category.name}"
 end
end
