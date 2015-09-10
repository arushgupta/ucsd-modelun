class Icon < ActiveRecord::Base
	belongs_to :category
	mount_uploader :overview_icon, ImageUploader
	mount_uploader :sechedule_icon, ImageUploader
	mount_uploader :commitee_icon, ImageUploader
	mount_uploader :speaker_icon, ImageUploader
	mount_uploader :fee_icon, ImageUploader
	mount_uploader :faq_icon, ImageUploader
	mount_uploader :training_session_icon, ImageUploader
	mount_uploader :travel_conferences_icon, ImageUploader
	mount_uploader :awards_icon, ImageUploader
	mount_uploader :alumni_icon, ImageUploader
	mount_uploader :galleries_icon, ImageUploader
	mount_uploader :secretariats_icon, ImageUploader
end
