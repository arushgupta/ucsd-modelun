class TravelConferencesController < ApplicationController

	def index
        @cat = Category.all.where("categories.category_id IS NOT NULL")
        @apply = ApplyNow.all
		@tconferences=TravelConference.all.where(category_id: params[:cat_id]).order('season ASC')
	end
end
