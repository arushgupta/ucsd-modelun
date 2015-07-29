class StaticPagesController < ApplicationController
  def home
    
    @categories = Category.all.where(:category_id => nil)

  end

  def index
  end

  def help
  end
end
