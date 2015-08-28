class PagesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]

  def index
    @categories = Category.all.where(category_id: nil)
    @pages = Page.find(1)
  end
  
  private
    def page_params
      params.require(:page).permit(:name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_active)
    end

end