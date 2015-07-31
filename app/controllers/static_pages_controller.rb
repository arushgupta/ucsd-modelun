class StaticPagesController < ApplicationController
  def index
  	@categories = Category.all
  	@cat=Category.all.where("categories.category_id IS NOT NULL")
  	debugger
  	@apply=ApplyNow.all

  end 
  def home
    
    @categories = Category.all.where(:category_id => nil)

  end

  def help
  end
end
