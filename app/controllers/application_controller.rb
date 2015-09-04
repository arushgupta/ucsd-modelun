class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :categories
private  
  def categories
  	@categories = Category.all.where(is_active: true).order('created_at ASC')
  end
end
