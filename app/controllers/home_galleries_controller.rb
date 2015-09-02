class HomeGalleriesController < ApplicationController
	
	def index
		@categories = Category.all
		@galleries = HomeGallery.where(category_id: params[:cat_id])
	end

end