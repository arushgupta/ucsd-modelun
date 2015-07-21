ActiveAdmin.register Question do
 menu priority: 9
 # belongs_to :faq
 permit_params :question, :answer, :faq_id
 config.batch_actions = false
 before_filter :skip_sidebar!, :only => :index
 # scope_to :faq
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

config.sort_order = 'faq_id_asc'

menu false

  action_item only: :index do
    #link_to "New Question", "1"
    link_to "New Question",  :controller => "questions", :action => "new", :id => params[:id].to_s
    #link_to "New Question", new_question_path, :id => params[:id].to_s
  end

index do
  selectable_column
  id_column
  column :question
  column :answer
  column :faq
  # column '' do |faq|
  #     #link_to 'Edit Q&A', admin_question_path(:faq_id => 2)
  #     link_to "New",  :controller => "questions", :id => params[:id] #admin_questions_path(q: { faq_id_eq: faq.id}), 'q[faq_id_eq]' => "#{faq.id}".html_safe
  # end

  actions
  
end

controller do
  def index
    if params[:id]
      @faq = Faq.find(params[:id])
      @questions = @faq.questions.page(params[:page]).per(10)
    end
      #@id = @faq.id


    index!
  #byebug
    
    # @question = Question.new
  end

  def new
    debugger
    @question = Question.new
    # @question.faq = @id
  end

  def create
    super do |format|
      redirect_to admin_question_path(id: faq.question.slug) and return if question.valid?
    end
  end

end

form do |f|
    f.inputs 'Question Details' do
      f.input :faq, :collection => FAQ.all.map {|faq| [faq.name, faq.id]}
      f.input :question
      f.input :answer, :as => :ckeditor
      f.actions
   end
end

# private
# def faqId
#   @faq_id = Faq.find(params[:id])
# end
end
