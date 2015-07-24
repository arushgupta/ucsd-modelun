ActiveAdmin.register Question do
  
  before_action :set_faq
  belongs_to :faq
  permit_params :question, :answer, :is_active
  config.batch_actions = false
  before_filter :skip_sidebar!, :only => :index
  navigation_menu :default
  menu false

  index do
    selectable_column
    id_column
    column :question
    column :answer
    column :faq
    column :is_active
    actions
  end

  controller do
  
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


  form do |f|
    f.inputs 'Question Details' do
      f.input :question
      f.input :answer, :as => :ckeditor
      f.input :is_active
    end
      f.actions
  end
end
