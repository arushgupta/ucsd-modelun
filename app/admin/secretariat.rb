ActiveAdmin.register Secretariat do

  menu priority: 5
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :position, :name, :major, :description, :image, :college, :category_id, :is_active
  decorate_with SecretariatDecorator

  controller do
    def show
      @page_title = "Secretariat Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :position
    column :college
    column :major
    column :description
    column :image
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Secretariat Details", multipart: true do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}, :include_blank => "select"
      f.input :position
      f.input :name
      f.input :college, :collection => ["Earl Warren College", "Eleanor Roosevelt College", "John Muir College", "Revelle College", "Sixth College", "Thurgood Marshall College"]
      f.input :major
      f.input :description
      f.input :image, :as => :file,:image_preview => true,label: "image (size 500x500)",:hint => f.object.id? ? image_tag(f.object.image.url) : ""
      f.input :description, :as => :ckeditor
      f.input :image, :as => :file, :image_preview => true, label: "image (size 500x500)" #, :hint => f.object.id? ? image_tag(f.object.image.url) : ""
      f.input :is_active
    end
    f.actions
  end
end
