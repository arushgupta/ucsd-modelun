ActiveAdmin.register HomeGallery do
  
  menu priority: 11
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :image_url, :image_text, :button_url, :button_text, :image_title, :category_id, :is_home_img, :is_active, :gallery_type
  decorate_with HomeGalleryDecorator

  controller do
    def show
      @page_title = "HomeGallery"
    end
  end

  index do
    selectable_column
    id_column
    column :image_title
    column :image_text
    column :image_url
    column :button_text
    column :button_url
    column :category
    column :is_home_img
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Home Gallery Details" do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :gallery_type, as: :select, collection: HomeGallery.types, include_blank: "select"
      f.input :image_title
      f.input :image_url, as: :file, image_preview: true, label: "Image (size 1400x730)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :image_text
      f.input :button_url
      f.input :button_text
      f.input :is_home_img, label: "Home Image"
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
