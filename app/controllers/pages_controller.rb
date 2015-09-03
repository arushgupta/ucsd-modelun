class PagesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]

  def index
    @categories = Category.all
    @pages = Page.all()
  end
  
  private
    def page_params
      params.require(:page).permit(:name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_active)
    end

end