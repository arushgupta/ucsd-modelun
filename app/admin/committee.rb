ActiveAdmin.register Committee do

  menu priority: 14
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :order, :committee, :chair, :vice_chair, :topic_guide_url, :category_id, :is_active, topics_attributes: [:order, :topic, :image_url, :description, :_destroy]

  index do
    selectable_column
    id_column
    column :category
    column :order
    column :committee
    column :chair
    column :vice_chair

    column :topic_guide_url

    column 'Topic Guide' do |upload|
      link_to upload.topic_guide_url.file.original_filename, download_committees_path(file: upload.topic_guide_url.file.original_filename )
    end
    column :category
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :order
      row :committee
      row :chair
      row :vice_chair
      row 'Topic Guide' do |upload|
        link_to upload.topic_guide_url.file.original_filename, committee_download_path(file: upload.topic_guide_url.file.original_filename, :committee_id => upload.id)
      end
      row :category
      row :is_active
    end
  end

  form do |f|
    f.inputs 'Committee Details', multipart: true do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :order
      f.input :committee
      f.input :chair
      f.input :vice_chair
      f.input :topic_guide_url, :as => :file, :hint => f.object.id? ? link_to(f.object.topic_guide_url.url): "", :label => "Topic Guide (PDF only)"
      f.input :is_active, :label => "Is Active"
    end
    f.actions
  end
end