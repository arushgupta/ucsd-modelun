ActiveAdmin.register Speaker do

  menu priority: 7
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :panel, :name, :description, :image_url, :is_active, :category_id
  decorate_with SpeakerDecorator

  controller do
    def show
      @page_title = "Speaker Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :panel
    column (:description) {|speaker| raw(speaker.description)}
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
      row :category
      row :name
      row :panel
      row (:description) {|speaker| raw(speaker.description)}
      row 'Image' do |finder|
        finder.image_url
      end
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Speaker Details' do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :name
      f.input :panel
      f.input :description, as: :ckeditor
      f.input :image_url, as: :file, image_preview: true, label: "Image (size 500x500)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
