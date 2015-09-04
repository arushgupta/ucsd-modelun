class TrainingSessionsController < ApplicationController
  
  def download
    send_file(
      "#{Rails.root}/public/uploads/committee/#{params[:file]}",
      filename: "#{params[:file]}",
      type: "application/pdf"
    )
  end

  def index
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    @trainingsessions = TrainingSession.all.where(category_id: params[:cat_id], is_active: true)
  end
end

