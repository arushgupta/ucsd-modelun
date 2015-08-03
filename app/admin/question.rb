ActiveAdmin.register Question do

  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  config.sort_order = 'id_asc'
  permit_params :question, :answer, :is_active
  before_action :set_faq
  belongs_to :faq
  navigation_menu :default
  menu false

  controller do
   
    def show
      @page_title = "Question"
    end

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

    private
    def set_faq
      @faq = Faq.find(params[:faq_id])
    end
  end
  
  index do
    selectable_column
    id_column
    column :question
    column (:answer){|question| raw(question.answer)}
    column :faq
    column :is_active
    actions
  end
  
  show do
    attributes_table do
      row :id
      row :question
      row (:answer){|question| raw(question.answer)}
      row :faq
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Question Details' do
      f.input :question
      f.input :answer, :as => :ckeditor
      f.input :is_active
    end
    f.actions
  end 
end
