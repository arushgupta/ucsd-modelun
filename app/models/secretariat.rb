class Secretariat < ActiveRecord::Base

  belongs_to :category

	attr_accessor :image_url
	mount_uploader :image_url, ImageUploader
	validates :position, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100 }
	validates :name, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100 }
	validates :college, presence: true, format: { with: /\A[a-zA-Z\s\-]+\z/}, length: { maximum: 100 }
	validates :major, presence: true, length: { maximum: 100 }
	validates :description, presence: true, length: { maximum: 750 }
	validates :image_url, presence: true
    #validate :validate_minimum_image_size 
  
# def image_url_provided?
#     !self.image_url.blank?

	# validates :image,:presence => true

#   def validate_minimum_image_size
#   	debugger
#   	unless self.image_url.blank?
#     	image1 = MiniMagick::Image.open(image_url.path)
#     	unless image1[:width] < 500 && image1[:height] < 500
#       	errors.add :image_url, "should be 500x500px maximum!" 
#     	end
#     end
# end
end
