class Secretariat < ActiveRecord::Base

  belongs_to :category
	mount_uploader :image_url, ImageUploader
	validates :position, :presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :college,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :major,:presence => true,:format => { :with => /\A[a-zA-Z\s\.',:(){}\-]+\z/},length: { maximum: 100}
	validates :description, :presence => true, length: { maximum: 1000}
	# validates :image,:presence => true
  validate :validate_minimum_image_size

  def validate_minimum_image_size
    image1 = MiniMagick::Image.open(image_url.path)
    unless image1[:width] < 500 && image1[:height] < 500
      errors.add :image_url, "should be 500x500px maximum!" 
    end
  end
end
