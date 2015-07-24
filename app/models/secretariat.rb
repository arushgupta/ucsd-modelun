class Secretariat < ActiveRecord::Base
	attr_accessor :image #If exists
	mount_uploader :image, ImageUploader
<<<<<<< HEAD
	validates :position, :presence => true,length: { maximum: 100} #:format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :name,:presence => true, length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :college,:presence => true,length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :major,:presence => true, length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :description,:presence => true,length: { maximum: 500} #:format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
	# validates :image,:presence => true
=======
	validates :position, :presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :college,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :major,:presence => true,:format => { :with => /\A[a-zA-Z\s\.',:(){}\-]+\z/},length: { maximum: 100}
	validates :description,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 1000}
	validates :image,:presence => true
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
    validate :validate_minimum_image_size
    def validate_minimum_image_size
     image1 = MiniMagick::Image.open(image.path)
      unless image1[:width] < 500 && image1[:height] < 500
        errors.add :image, "should be 500x500px maximum!" 
      end
    end
end
