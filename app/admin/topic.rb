ActiveAdmin.register Topic do

  menu false
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :order, :topic, :image_url, :description, :is_active
  before_action :set_committee
  belongs_to :committee
  navigation_menu :default
  menu false
  controller do
  
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
    column :order
    column :topic
    column :image_url
    column (:description) {|topic| raw(topic.content)}
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Topic Details' do
      f.input :order
      f.input :topic
      f.input :image_url, :as => :file, :image_preview => true, label: "image (size 500x500)" , :hint => f.object.id? ? image_tag(f.object.image_url.url) : ""
      f.input :description, :as => :ckeditor
      f.input :is_active
    end
      f.actions
  end
end
