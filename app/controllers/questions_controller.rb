class QuestionsController < ApplicationController

before_action :admin_user,     only: [:destroy, :create]
  
  def new
  	@question = Question.new
  end
  
  def create
    
    if @question.exists
      return redirect_to :action => 'index'
    end

  	 @question = Question.new(question_params)
      if @question.save
        redirect_to root_url
      else
        render 'new'
      end
  end
  
  def show
    @question = Question.find(params[:id])
  end

  def index
  	# @questions = Question.find(params[:faq_id])
  	# @questions = Question.where()
    puts 2
  	@faq = Faq.find(params[:faq_id])

    questions = Question.where(faq_id: params[:faq_id]).to_a.count

  	# redirect_to showimport_admin_question_path(@question), :notice => 'Imported'
    # @questions = Question.order(:id)
  end
  
  private
  def question_params
    params.require(:question).permit(:question, :answer, :faq_id)
  end
end
