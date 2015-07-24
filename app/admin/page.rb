ActiveAdmin.register Page do

  menu priority: 2
  before_filter :skip_sidebar!, :only => :index
  permit_params :name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_active
  config.batch_actions = false

  controller do
    def show
      @page_title = "Page Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :summary
    column :content
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Page Details" do
      f.input :name
      f.input :summary
      f.input :content, :as => :ckeditor
      f.input :meta_keywords
      f.input :meta_title
      f.input :is_active
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]},:include_blank => "select"
    end
    f.actions
  end
end