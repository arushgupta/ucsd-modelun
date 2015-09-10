class Sponsor < ActiveRecord::Base
  
  belongs_to :category
  attr_accessor :logo_url
  mount_uploader :logo_url, ImageUploader

end
