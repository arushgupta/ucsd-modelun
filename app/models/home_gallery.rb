class HomeGallery < ActiveRecord::Base

	belongs_to :category
	enum type: { "TritonMun" => "T", "SdiMun" => "S", "Travel"=> "V"}

	attr_accessor :image_url
	mount_uploader :image_url, ImageUploader
	validates :category, presence: true
end
