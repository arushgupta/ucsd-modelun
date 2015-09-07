class FaqsController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def index
    @categories = Category.all.where(is_active: true).order('created_at ASC')
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    @faqs = Faq.all.where(category_id: params[:cat_id], is_active: true)
    @question_count = Question.group(params[:id]).count
  end

  private
  def faq_params
    params.require(:faqs).permit(:name, :category_id)
  end
end
