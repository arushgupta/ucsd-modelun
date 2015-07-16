class PagesController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@page = Page.new
  end
  
  def create
  	 @page = Page.new(user_params)
      if @page.save
        # UserMailer.account_activation(@user).deliver_now
        redirect_to root_url
      else
        render 'new'
      end
  end

end