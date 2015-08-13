class DeadlinesController < ApplicationController
	def index
		@deadlines=Deadline.all.where(category_id: params[:id])
	end
end
