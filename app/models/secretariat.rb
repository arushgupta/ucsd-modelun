class Secretariat < ActiveRecord::Base
	attr_accessor :image #If exists
	mount_uploader :image, ImageUploader
	validates :position, :presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :college,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :major,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :description,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\.'\-]+\z/},length: { maximum: 500}
	validates :image,:presence => true
    validate :validate_minimum_image_size
    def validate_minimum_image_size
     image1 = MiniMagick::Image.open(image.path)
      unless image1[:width] < 500 && image1[:height] < 500
        errors.add :image, "should be 500x500px maximum!" 
      end
    end
end
