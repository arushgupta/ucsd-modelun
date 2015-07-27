ActiveAdmin.register Faq do
 
  menu priority: 3
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :name, :category_id, :is_active, questions_attributes: [:question, :answer, :id, :_destroy]

  controller do
    def show
      @page_title = "Faq Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :is_active
    column '' do |faq|
      link_to "Questions", admin_faq_questions_path(:faq_id => faq)
    end
    actions
  end

  form do |f|
    f.inputs 'FAQs Details' do
      f.input :name
      f.input :is_active
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
    end
    f.actions
  end
end