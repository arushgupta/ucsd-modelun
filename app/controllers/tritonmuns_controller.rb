class TritonmunsController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@tritonmun = Tritonmun.new
  end
  
  def create
  	 @tritonmun = Tritonmun.new(user_params)
      if @tritonmun.save
        # UserMailer.account_activation(@user).deliver_now
        redirect_to root_url
      else
        render 'new'
      end
  end

end
