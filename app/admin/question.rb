ActiveAdmin.register Question do
  before_action :set_faq
  menu priority: 9
  belongs_to :faq
  permit_params :question, :answer#, :faq_id
  config.batch_actions = false
  before_filter :skip_sidebar!, :only => :index
  navigation_menu :default
  menu false
controller do
    def show
      @page_title = " Question"
    end
  end
  # sortable tree: true,
  #          # Only display the parent menu's roots
  #          roots_collection: proc { parent.questions.roots }
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

#config.sort_order = 'faq_id_asc'

 # menu false

   # action_item only: :index do
   #  debugger
   #  # admin/questions 
   #  #link_to "New Question", "1"
   #  # link_to "New Question",  :controller => "faqs/questions", :action => "new", :id => params[:id].to_s
   #  #link_to "New Question", new_admin_faq_question_path("faq_id" => params[:faq_id].to_s)#, :action => "new"#, :faq_id => params[:faq_id].to_s
   # endz

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
  
  # @@faq = 0

  def index
    if params[:id]
      @faq = Faq.find(params[:id])
      @questions = @faq.questions.page(params[:page]).per(10)
    end
    index!
  end

  def new
    @question = Question.new
  end

  # def create
  #   # if @question.exists
  #   #   return redirect_to :action => 'index'
  #   # end
  #   # @faq = Faq.find(params[:id])
  #   # debugger
  #    #@question = Question.new(question_params)
  #    # debugger
  #    # @faq = Faq.find(params[:id])

  #    #@question = Question.create()

  #     if @question.save
  #       # @faq = Faq.find(params[:id])
  #       redirect_to admin_faq_questions_path(:faq_id => params[:faq_id].to_s)# and return if question.valid?#{}"Questions",  :controller => "questions", :id => @question.faq_id
  #     else
  #       render 'new'
  #     end
  #   # super do |format|
  #   #   redirect_to admin_question_path(id: faq.question.slug) and return if question.valid?
  #   # end
  # end

  private
  # def ques_hash(params)
  #   # "question"=>{"question"=>"q4", "answer"=>"<p>a4</p>\r\n"}
  #   @ques_hs = {}
  #   debugger
  #   @ques_hs['question'] = params[:question].to_a[0][1]
  #   @ques_hs['answer'] = params[:question].to_a[1][1]
  #   @ques_hs['faq_id'] = params[:faq_id]
  #   @ques_hs
  # end

  # def question_params
  #   #params.require(:question).permit(:question, :answer, :faq_id => params[:faq_id])
  # end
  # # def find_faq
  # #   debugger
  # #   @@faq = Faq.find(params[:id])
  # # end

  def set_faq
    @faq = Faq.find(params[:faq_id])
  end
end


form do |f|
    f.inputs 'Question Details' do
      # f.hidden_field :faq, :name => "faq_id", :value => params[:faq_id], :id => "faq_id"
      # debugger
      f.input :question
      f.input :answer, :as => :ckeditor
   end
     f.actions
end

end
