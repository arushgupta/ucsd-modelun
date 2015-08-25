class Icon < ActiveRecord::Base
	belongs_to :category
	mount_uploader :overview_icon, ImageUploader
	mount_uploader :sechedule_icon, ImageUploader
	mount_uploader :commitee_icon, ImageUploader
	mount_uploader :speaker_icon, ImageUploader
	mount_uploader :fee_icon, ImageUploader
	mount_uploader :faq_icon, ImageUploader
end
