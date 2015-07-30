ActiveAdmin.register ApplyNow do

  menu priority: 10
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :headline, :button_url, :button_text, :image_url, :category_id, :is_active
  decorate_with ApplyNowDecorator

  controller do
    def show
      @page_title = "Apply"
    end
  end

  index do
    selectable_column
    id_column
    column :headline
    column :button_url
    column :button_text
    column 'Image' do |finder|
      debugger
      finder.image_url
    end
    column :category
    column :is_active
    actions
  end
  
  form do |f|
    f.inputs "Apply Now Button Details" do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}, :include_blank => "select"
      f.input :headline
      f.input :button_text
      f.input :button_url
      f.input :image_url, :as => :file, :image_preview => true, label: "Image (size 500x500)", :hint => f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
