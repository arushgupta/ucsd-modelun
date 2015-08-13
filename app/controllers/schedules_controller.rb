class SchedulesController < ApplicationController
	def index
     @schedules=Schedule.all.where(category_id: params[:id])
	end
end
