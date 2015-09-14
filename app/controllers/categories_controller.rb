class CategoriesController < ApplicationController

  def index
    # @icons = Icon.where(is_active: true)
    # @categories = Category.all.where(is_active: true).order('created_at ASC')
    # #@cat=Category.all.where("categories.category_id IS NOT NULL")
    # # @homeimages = HomeGallery.all.where(category_id: params[:id])
    # @pages = Page.all.where(category_id: params[:id], is_active: true).order('created_at ASC')
    # @contact = Contact.new
    # @overviews = Overview.all.where(category_id: params[:id], is_active: true)
    # @sponsors = Sponsor.all.where(is_active: true)
    # @overviews=Overview.all.where(category_id: params[:id],is_active: true).first
    # @faqs=Faq.all.where(category_id: params[:id])
    # @schedules=Schedule.all.where(category_id: params[:id])
    # @committees=Committee.all.where(category_id:params[:id])
    # @deadlines=Deadline.all.where(category_id: params[:id])
    # @speakers=Speaker.all.where(category_id: params[:id])
    # @secretariats = Secretariat.all.where(category_id: params[:id])
  end

  def show
    @icons = Icon.where(is_active: true)
    @categories = Category.all.where(is_active: true).order('created_at ASC')
    #@cat=Category.all.where("categories.category_id IS NOT NULL")
    # @homeimages = HomeGallery.all.where(category_id: params[:id])
    @category = Category.friendly.find(params[:id])
    @pages = @category.pages.where(is_active: true).order('created_at ASC')
    @contact = Contact.new
    @overviews = @category.overviews.where(is_active: true)
    @sponsors = Sponsor.all.where(is_active: true)
    # @overviews=Overview.all.where(category_id: params[:id],is_active: true).first
    # @faqs=Faq.all.where(category_id: params[:id])
    # @schedules=Schedule.all.where(category_id: params[:id])
    # @committees=Committee.all.where(category_id:params[:id])
    # @deadlines=Deadline.all.where(category_id: params[:id])
    # @speakers=Speaker.all.where(category_id: params[:id])
    # @secretariats = Secretariat.all.where(category_id: params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name, :is_active, :category_id)
  end
end
