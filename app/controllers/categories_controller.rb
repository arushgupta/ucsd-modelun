class CategoriesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@category = Category.new
  end
  
  def create
  	 @category = Category.new(user_params)
      if @category.save
        # UserMailer.account_activation(@user).deliver_now
        redirect_to root_url
      else
        render 'new'
      end
  end

end
