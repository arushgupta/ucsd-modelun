class DeadlinesController < ApplicationController
  
  def index
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
	@deadlines = Deadline.all.where(category_id: params[:cat_id])
  end
end
