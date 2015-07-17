class CategoriesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@category = Category.new
  end
  
  def create
  	 @category = Category.new(category_params)
      if @category.save
        # UserMailer.account_activation(@user).deliver_now
        redirect_to root_url
      else
        render 'new'
      end
  end
  
  def show
    @page = Page.find(params[:id])
  end

  def index
    @categories = Category.order(:id)
    @categories = Category.paginate(page: params[:category], per_page: 5)
  end
  
  private
  def category_params
    params.require(:category).permit(:name,:is_deleted, :category_id)
  end
end
