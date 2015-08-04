ActiveAdmin.register Committee do

  menu priority: 14
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :order, :committee_name, :chair, :vice_chair, :topic_guide_url, :image_url, :category_id, :is_active, topics_attributes: [:order, :topic_name, :image_url, :description, :_destroy]
  decorate_with SecretariatDecorator

  index do
    selectable_column
    id_column
    column :committee_name
    column :chair
    column :vice_chair
    column :order
    column 'Image' do |finder|
      finder.image_url
    end
    column 'Topic Guide' do |upload|
      link_to upload.topic_guide_url.file.original_filename, download_committees_path(file: upload.topic_guide_url.file.original_filename )
    end
    column 'Topics' do |committee|
      link_to "Add Topics", admin_committee_topics_path(:committee_id => committee)
    end
    column :category
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :committee_name
      row :chair
      row :vice_chair
      row :order
      row 'Image' do |finder|
        finder.image_url
      end
      row 'Topic Guide' do |upload|
        link_to upload.topic_guide_url.file.original_filename, committee_download_path(file: upload.topic_guide_url.file.original_filename, :committee_id => upload.id)
      end
      row :category
      row :is_active
      row 'Topics' do |committee|
        link_to "Add Topics", admin_committee_topics_path(:committee_id => committee)
      end
    end
  end

  form do |f|
    f.inputs 'Committee Details', multipart: true do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :order
      f.input :committee_name
      f.input :chair
      f.input :vice_chair
      f.input :image_url, :as => :file,:image_preview => true,label: "image (size 1400x730)",:hint => f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :topic_guide_url, :as => :file, :hint => f.object.id? ? link_to(f.object.topic_guide_url.url): "", :label => "Topic Guide (PDF only)"
      f.input :is_active, :label => "Is Active"
    end
    f.actions
  end
end