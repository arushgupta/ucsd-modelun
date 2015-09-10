class UsersController < ApplicationController
	 # before_action :admin_user,     only: [:destroy, :create]
  def new
  	@user = User.new
  end
  
  def create
    @categories = Category.all.where(is_active: true)
  	@user = User.new(user_params)
    @user_details = "http://#{request.host_with_port}/users/unsubscribe?email=#{@user.email}"
    if @user.save
      UserMailer.welcome_email(@user, @user_details).deliver_now
      render "create"
    else
      render :json => { :error => @user.errors.full_messages.to_sentence }, 
           :status => :unprocessable_entity
    end
  end

  def index
      @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end

  def unsubscribe
    @categories = Category.all.where(is_active: true)
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
