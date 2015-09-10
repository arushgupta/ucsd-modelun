class UsersController < ApplicationController
	 # before_action :admin_user,     only: [:destroy, :create]
  def new
  	@user = User.new
  end
  
  def create
    user_details = "http://#{request.host_with_port}/users/unsubscribe?email="
    @categories = Category.all.where(is_active: true)
    user , status = check_email(params[:user][:email])
    if status
      user.first.update_attributes(is_active: true)
      UserMailer.welcome_email(user.first, user_details).deliver_now
      return render "create"
    end

  	@user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user, user_details).deliver_now
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
    @categories = Category.all.where(is_active:true)
    @user = User.where(email: params[:email]).first
    @user.update_attributes(is_active: false)
  end
  
  private
    def check_email(email)
      @user = User.where(email: email, is_active: false)
      return @user, true if @user.any?
      return [],false 
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
