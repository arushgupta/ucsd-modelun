ActiveAdmin.register Question do

  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :question, :answer, :is_active
  before_action :set_faq
  belongs_to :faq
  navigation_menu :default
  menu false

  index do
    selectable_column
    id_column
    column :question
    column :answer #raw ActionView::Helpers::SanitizeHelper.strip_links(:answer)
    # raw strip_tags(answer)
    column :faq
    column :is_active
    actions
  end

  controller do
    
    def show
      @page_title = " Question"
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
    column :answer
    column :faq
    column :is_active
    actions
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
