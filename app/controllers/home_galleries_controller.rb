class HomeGalleriesController < ApplicationController
  def index
	@galleries = HomeGallery.where(is_active: true)
  end
end