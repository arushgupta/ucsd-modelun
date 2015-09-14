class CommitteesController < ApplicationController
  
  def download
      send_file(
        "#{Rails.root}/public/uploads/committee/#{params[:file]}",
        filename: "#{params[:file]}",
        type: "application/pdf"
      )
  end

  def index
    @categories = Category.all.where(is_active: true).order('created_at ASC')
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    category = Category.friendly.find(params[:cat_id])
  	@committees = category.committees.order('order_id ASC')
  end

end
