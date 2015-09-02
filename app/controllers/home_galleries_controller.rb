class HomeGalleriesController < ApplicationController
  def index
	@categories = Category.all
	@galleries = HomeGallery.where(is_active: true)
  end
end