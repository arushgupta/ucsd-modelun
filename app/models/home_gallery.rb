class HomeGallery < ActiveRecord::Base

	belongs_to :category

	attr_accessor :image_url
	mount_uploader :image_url, ImageUploader
	#validates_format_of :button_url, :with => URI::regexp(%w(http https))
	#validates :button_url, presence: true, :format => {:with => URI.regexp}
	validates :button_text,:format => { :with => /\A[a-zA-Z\-]+\z/},length: { maximum: 15 }
	validates :image_text,:format => { :with => /\A[a-zA-Z\-]+\z/},length: { maximum: 50 }
	validate :validate_minimum_image_size
    def validate_minimum_image_size
     image1 = MiniMagick::Image.open(image_url.path)
      unless image1[:width] > 1400 && image1[:height] > 730
        errors.add :image_url, "should be 1400x730px minimum!" 
      end
    end
end
