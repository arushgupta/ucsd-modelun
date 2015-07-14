class UsersController < ApplicationController
	 before_action :admin_user,     only: [:destroy, :create]
  def new
  	@user = User.new
  end
  
  def create
  	 @user = User.new(user_params)
      if @user.save
        # UserMailer.account_activation(@user).deliver_now
        redirect_to root_url
      else
        render 'new'
      end
  end

  def index
      @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
