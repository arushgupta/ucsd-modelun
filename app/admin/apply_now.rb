
ActiveAdmin.register ApplyNow do

  menu priority: 10
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :title, :button_url, :button_text, :category_id, :is_active

  controller do
    def show
      @page_title = "Apply"
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :button_url
    column :button_text
    column :category
    column :is_active
    actions
  end
  
  form do |f|
    f.inputs "Apply Now Button Details" do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}, :include_blank => "select"
      f.input :title
      f.input :button_text
      f.input :button_url
      f.input :is_active
    end
    f.actions
  end
end
