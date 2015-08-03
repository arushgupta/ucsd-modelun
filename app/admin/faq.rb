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
    column 'Questions' do |faq|
      link_to "Add Questions", admin_faq_questions_path(:faq_id => faq)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :category
      row :is_active
      row 'Questions' do |faq|
        link_to "Add Questions", admin_faq_questions_path(:faq_id => faq)
      end
    end
  end

  form do |f|
    f.inputs 'FAQs Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :name
      f.input :is_active
    end
    f.actions
  end
end