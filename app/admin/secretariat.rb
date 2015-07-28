ActiveAdmin.register Secretariat do

  menu priority: 5
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :position, :name, :major, :description, :image_url, :college, :category_id, :is_active
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
    column (:description) {|secretariat| raw(secretariat.description)}
    column :image_url
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Secretariat Details", multipart: true do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}, :include_blank => "select"
      f.input :position
      f.input :name
      f.input :college, :collection => ["Earl Warren College", "Eleanor Roosevelt College", "John Muir College", "Revelle College", "Sixth College", "Thurgood Marshall College"],:include_blank => "select"
      f.input :major
      f.input :description, :as => :ckeditor
      f.input :image_url, :as => :file, :image_preview => true, label: "image (size 500x500)", :hint => f.object.id? ? image_tag(f.object.image_url.url) : ""
      f.input :is_active
    end
    f.actions
  end
end
