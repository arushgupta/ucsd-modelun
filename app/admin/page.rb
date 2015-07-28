ActiveAdmin.register Page do
before_filter :skip_sidebar!, :only => :index
menu priority: 2

config.batch_actions = false
permit_params :name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_active
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
    column (:content) {|page| raw(page.content)}
    column :category
    column :is_active
    actions
  end

show do
  attributes_table do
     row :id
     row :name
     row :summary
     row (:content) {|page| raw(page.content)}
     row :meta_keywords
     row :meta_title
     row :category
     row :is_active
     row :created_at
     row :updated_at
 end
end

  form do |f|
    f.inputs "Page Details" do
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]},:include_blank => "select"
      f.input :name
      f.input :summary
      f.input :content, :as => :ckeditor
      f.input :meta_keywords
      f.input :meta_title
      f.input :is_active
    end
    f.actions
  end
end
