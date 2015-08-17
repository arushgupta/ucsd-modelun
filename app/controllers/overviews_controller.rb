class OverviewsController < ApplicationController
  def index
  	@categories = Category.all
      @cat = Category.all.where("categories.category_id IS NOT NULL")
      @apply = ApplyNow.all
      @overviews=Committee.all.where(category_id: params[:cat_id])
  end
end
