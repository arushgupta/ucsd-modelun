class CommitteesController < ApplicationController
  
  def download
      send_file(
        "#{Rails.root}/public/uploads/committee/#{params[:file]}",
        filename: "#{params[:file]}",
        type: "application/pdf"
      )
  end

  def index
    @categories = Category.all
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
  	@committees = Committee.all.where(category_id: params[:cat_id]).order('order_id ASC')
  end

end
