class TrainingSessionsController < ApplicationController
  
  def download
    send_file(
      "#{Rails.root}/public/uploads/committee/files/#{params[:file]}",
      filename: "#{params[:file]}",
      type: "application/pdf"
    )
  end

  def index
    @categories = Category.all.where(is_active: true).order('created_at ASC')
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    @trainingsessions = TrainingSession.all.where(is_active: true)
  end
end

