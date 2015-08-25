ActiveAdmin.register Topic do

  menu false
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :order_id, :topic_name, :image_url, :description, :is_active
  before_action :set_committee
  belongs_to :committee
  navigation_menu :default
  menu false
  decorate_with TopicDecorator

  controller do
    def show
      @page_title = "Topic Details"
    end

    def index
      if params[:id]
        @committee = Committee.find(params[:id])
        @topics = @committee.topics.page(params[:page]).per(10)
      end
      index!
    end

    def new
     @topic = Topic.new
    end

    private
    def set_committee
      @committee = Committee.find(params[:committee_id])
    end
  end

  index do
    selectable_column
    id_column
    column :order_id
    column :topic_name
    column :image_url
    column (:description) {|topic| raw(topic.description)}
    column 'Committee' do |finder|
      link_to finder.committee.committee_name, admin_committees_path
    end
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :id
      row :order_id
      row :topic_name
      row :image_url
      row (:description) {|topic| raw(topic.description)}
      row 'Committee' do |finder|
        link_to finder.committee.committee_name, admin_committees_path
      end
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Topic Details' do
      f.input :order_id
      f.input :topic_name
      f.input :image_url, as: :file, image_preview: true, label: "Image (size 500x500)" , hint: f.object.id? ? image_tag(f.object.image_url.url) : ""
      f.input :description, as: :ckeditor
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
