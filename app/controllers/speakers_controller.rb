class SpeakersController < ApplicationController
	def index
		 @speakers=Speaker.all.where(category_id: params[:id])
	end
end
