class StaticPagesController < ApplicationController
  before_filter :find_category
  def index
    @tritonmun = HomeGallery.where(gallery_type: "T").order('created_at DESC').last(3)
    @sdimun = HomeGallery.where(gallery_type: "S").order('created_at DESC').last(3)
    @travel = HomeGallery.where(gallery_type: "V").order('created_at DESC').last(3)
    @secretariats = Secretariat.where(is_active: true).last(3)
    @user = User.new
  end 
  
  def home
    @categories = Category.all.where(:category_id => nil)
  end

  def help

  end

  def about

  end

  private
    def find_category
      @categories = Category.all.where(is_active: true)
      @cat = Category.all.where("categories.category_id IS NOT NULL")
      @apply = ApplyNow.all
    end
end
