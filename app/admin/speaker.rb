ActiveAdmin.register Speaker do

  menu priority: 7
  menu parent: "Conferences"
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :panel, :name, :description, :fb_url, :tw_url, :in_url, :website_url, :image_url, :is_active, :category_id
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
    column 'Facebook' do |finder|
      finder.fb_url
    end
    column 'Twitter' do |finder|
      finder.tw_url
    end
    column 'LinkedIn' do |finder|
      finder.in_url
    end
    column 'Personal Website' do |finder|
      finder.website_url
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
      row 'Facebook' do |finder|
        finder.fb_url
      end
      row 'Twitter' do |finder|
        finder.tw_url
      end
      row 'LinkedIn' do |finder|
        finder.in_url
      end
      row 'Personal Website' do |finder|
        finder.website_url
      end
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
      f.input :fb_url, label: 'Facebook'
      f.input :tw_url, label: 'Twitter'
      f.input :in_url, label: 'LinkedIn'
      f.input :website_url, label: 'Personal Website'
      f.input :description, as: :ckeditor
      f.input :image_url, as: :file, image_preview: true, label: "Image (width 200px)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
