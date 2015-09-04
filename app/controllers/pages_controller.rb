class PagesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]

  def index

    @categories = Category.all.where(is_active: true).order('created_at ASC')
    @pages = Page.find(6)
  end

  def show
    @categories = Category.all.where(is_active: true).order('created_at ASC')
    @pages = Page.find(params[:id])
  end
  
  private
    def page_params
      params.require(:page).permit(:name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_active)
    end

end