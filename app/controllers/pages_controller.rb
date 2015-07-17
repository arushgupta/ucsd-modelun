class PagesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@page = Page.new
  end
  
  def create
  	@page = Page.new(page_params)
    if @page.save
        # UserMailer.account_activation(@user).deliver_now
      redirect_to root_url
    else
     render 'new'
    end    
  end


  def index
    # @pages = Page.paginate(page: params[:page], per_page: 5)
  end

  def show
    @page = Page.find(params[:id])
  end
  
  private
    def page_params
      params.require(:page).permit(:name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_deleted)
    end

end