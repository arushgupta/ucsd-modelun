class SchedulesController < ApplicationController
	def index
	@categories = Category.all
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    @schedules = Schedule.all.where(category_id: params[:cat_id], is_active: true)
	end
end
