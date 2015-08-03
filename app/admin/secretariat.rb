ActiveAdmin.register Secretariat do

  menu priority: 5
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :position, :name, :major, :description, :image_url, :college, :category_id, :is_active
  decorate_with SecretariatDecorator
  config.sort_order = 'id_asc'

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
    column 'Image' do |finder|
      finder.image_url
    end
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
      f.input :description, label: "Description", :as => :ckeditor
      f.input :image_url, :as => :file, :image_preview => true, label: "Image (size 500x500)", :hint => f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :category
      row :name
      row :position
      row :college
      row :major
      row (:description) {|secretariat| raw(secretariat.description)}
      row :image_url 
      row :is_active
      row :created_at
      row :updated_at
    end
  end
end
