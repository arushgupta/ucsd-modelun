ActiveAdmin.register Committee do

  menu priority: 14
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :order, :committee, :chair, :vice_chair, :topic_guide_url, :category_id, :is_active, topics_attributes: [:order, :topic, :image_url, :description, :_destroy]
  
  controller do
    def show
      @page_title = "Committee Details"
    end
  end

  index do
    selectable_column
    id_column
    column :order
    column :committee
    column :chair
    column :vice_chair
    column 'Topic Guide' do |upload|
      upload.topic_guide_url.file.original_filename
    end
    column :category
    column :is_active
    column '' do |committee|
      link_to "Topics", admin_committee_topics_path(:committee_id => committee)
    end
    actions
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