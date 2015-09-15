ActiveAdmin.register Committee do

  menu priority: 14
  menu parent: "Conferences"
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :order_id, :committee_name, :chair, :vice_chair, :topic_guide_url, :image_url, :category_id, :is_active, topics_attributes: [:order, :topic_name, :image_url, :description, :_destroy]
  decorate_with CommitteeDecorator

  controller do

    def show
      @page_title = "Committee Details"
    end
  end



  index do
    selectable_column
    id_column
    column :committee_name
    column :chair
    column :vice_chair
    column :order_id
    column 'Image' do |finder|
      finder.image_url
    end
    column 'Topic Guide' do |upload|
      unless upload.topic_guide_url.blank?
        link_to upload.topic_guide_url.file.original_filename, download_committees_path(file: upload.topic_guide_url.file.original_filename )
      end 
    end
    column :category
    column :is_active
    column 'Topics' do |committee|
      link_to "Add Topics", admin_committee_topics_path(committee_id: committee)
    end  
    actions
  end

  show do
    attributes_table do
      row :committee_name
      row :chair
      row :vice_chair
      row :order_id
      row 'Image' do |finder|
        finder.image_url
      end
      row 'Topic Guide' do |upload|
        unless upload.topic_guide_url.blank?
          link_to upload.topic_guide_url.file.original_filename, committee_download_path(file: upload.topic_guide_url.file.original_filename, committee_id: upload.id)
        end
      end
      row :category
      row :is_active
      row 'Topics' do |committee|
        link_to "Add Topics", admin_committee_topics_path(committee_id: committee)
      end
    end
  end

  form do |f|
    f.inputs 'Committee Details', multipart: true do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :order_id
      f.input :committee_name
      f.input :chair
      f.input :vice_chair
      f.input :topic_guide_url, as: :file, hint: f.object.id? ? link_to(f.object.topic_guide_url.url): "", label: "Topic Guide (PDF only)"
      f.input :image_url, as: :file, image_preview: true, label: "Image (size 300x225)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end