ActiveAdmin.register Alumni do

  menu priority: 12
  menu parent: "About"
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :email, :name, :major, :bio, :image_url, :is_active, :category_id
  decorate_with AlumniDecorator

  controller do
    def show
      @page_title = "Alumni Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :major
    column (:bio) {|alumni| raw(alumni.bio)}
    column 'Image' do |finder|
      finder.image_url
    end
    column :category
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :major
      row (:bio) {|alumni| raw(alumni.bio)}
      row 'Image' do |finder|
        finder.image_url
      end
      row :category
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Alumni Details' do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :name
      f.input :major
      f.input :email
      f.input :bio, as: :ckeditor
      f.input :image_url, as: :file, image_preview: true, label: "Image (width 200px)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
