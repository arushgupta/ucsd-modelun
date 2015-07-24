ActiveAdmin.register Topic do

  before_action :set_committee
  belongs_to :committee
  permit_params :order, :topic, :image, :description, :is_active
  config.batch_actions = false
  before_filter :skip_sidebar!, :only => :index
  navigation_menu :default
  menu false

  index do
    selectable_column
    id_column
    column :order
    column :topic
    column :image
    column :description
    column :is_active
    actions
  end
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


  form do |f|
    f.inputs 'Topic Details' do
      f.input :order
      f.input :topic
      f.input :image, :as => :file, :image_preview => true, label: "image (size 500x500)", :hint => f.object.id? ? image_tag(f.object.image.url) : ""
      f.input :description, :as => :ckeditor
      f.input :is_active
    end
      f.actions
  end
end
