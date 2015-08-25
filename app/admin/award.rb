ActiveAdmin.register Award do

  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  config.sort_order = 'id_asc'
  permit_params :award, :award_count, :is_active
  before_action :set_travel_conference
  belongs_to :travel_conference
  navigation_menu :default
  menu false

  controller do
    def show
      @page_title = "Award Details"
    end

    def index
      if params[:travel_conference_id]
        @travel_conference = TravelConference.find(params[:travel_conference_id])
        @awards = @travel_conference.awards.page(params[:page]).per(10)
      end
      # index!
    end

    def new
      @award = Award.new
    end

    private
    def set_travel_conference
      @travel_conference = TravelConference.find(params[:travel_conference_id])
    end
  end
  
  index do
    selectable_column
    id_column
    column :award
    column :award_count
    column :is_active
    actions
  end
  
  show do
    attributes_table do
      row :id
      row :award
      row :award_count
      row :is_active
    end
  end

  form do |f|
    f.inputs 'Question Details' do
      f.input :award
      f.input :award_count
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
