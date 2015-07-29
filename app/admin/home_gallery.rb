ActiveAdmin.register HomeGallery do
  
  menu priority: 11
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :image_url, :image_text, :button_url, :button_text, :title, :category_id, :is_active
  decorate_with HomeGalleryDecorator

  controller do
    def show
      @page_title = "HomeGallery"
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :image_text
    column :image_url
    column :button_text
    column :button_url
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Home Gallery Details" do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}, :include_blank => "select"
      f.input :title
      f.input :image_url, :as => :file,:image_preview => true,label: "image (size 1400x730)",:hint => f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :image_text
      f.input :button_url
      f.input :button_text
      f.input :is_active
    end
    f.actions
  end
end
