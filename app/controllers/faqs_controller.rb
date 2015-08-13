class FaqsController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new                                                                
  	@faq = Faq.new
  end
  
  def create
    
    if @faq.exists
      return redirect_to :action => 'index'
    end

  	 @faq = Faq.new(faq_params)
      if @faq.save
        redirect_to root_url
      else
        render 'new'
      end
  end
  
  def show
    @faq = Faq.find(params[:id])
  end

  def index
    @faqs=Faq.all.where(category_id:params[:id])
  end

  private
  def faq_params
    params.require(:faqs).permit(:name, :category_id)
  end
end
