class Secretariat < ActiveRecord::Base
	attr_accessor :image #If exists
	mount_uploader :image, ImageUploader
	validates :position, :presence => true,length: { maximum: 100} #:format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :name,:presence => true, length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :college,:presence => true,length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :major,:presence => true, length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :description,:presence => true,length: { maximum: 500} #:format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
	# validates :image,:presence => true
    validate :validate_minimum_image_size
    def validate_minimum_image_size
     image1 = MiniMagick::Image.open(image.path)
      unless image1[:width] < 500 && image1[:height] < 500
        errors.add :image, "should be 500x500px maximum!" 
      end
    end
end
