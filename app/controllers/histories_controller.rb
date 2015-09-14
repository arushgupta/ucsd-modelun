class HistoriesController < ApplicationController

  def index
  	@categories = Category.all.where(is_active: true).order('created_at ASC')
    @cat = Category.all.where("categories.category_id IS NOT NULL")
  	@histories = History.all.where(is_active: true).order('year DESC')
  end
end
