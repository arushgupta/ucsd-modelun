class HomeGalleriesController < ApplicationController
  def index
  	@categories = Category.all.where(is_active: true).order('created_at ASC')
		@galleries = HomeGallery.where(is_active: true, is_home_img: false)
  end
end