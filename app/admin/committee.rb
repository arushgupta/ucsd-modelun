ActiveAdmin.register Committee do

  menu priority: 14
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :order, :committee, :chair, :vice_chair, :topic_guide, :category_id, :is_active, questions_attributes: [:order, :topic, :image, :description, :_destroy]
  
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
    column :topic_guide
    column :category
    column :is_active
    column '' do |committee|
      link_to "Topics", admin_committee_topics_path(:committee_id => committee)
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Committee Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :order
      f.input :committee
      f.input :chair
      f.input :vice_chair
      f.input :topic_guide, :as => :file
      f.input :is_active
    end
    f.actions
  end
end