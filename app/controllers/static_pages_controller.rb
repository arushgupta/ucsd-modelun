class StaticPagesController < ApplicationController
  before_filter :find_category
  def index
   @images = HomeGallery.where(category_id: nil)	
# @categories = Category.all
#     @cat=Category.all.where("categories.category_id IS NOT NULL")
#     debugger
#     @apply=ApplyNow.all
  end 
  def home
    
    @categories = Category.all.where(:category_id => nil)

  end

  def help

  end

  def about
    
    # @categories = Category.all
    # @cat=Category.all.where("categories.category_id IS NOT NULL")
    # @apply=ApplyNow.all
  end

  private
    def find_category
    @categories = Category.all
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @apply = ApplyNow.all
    end
end
