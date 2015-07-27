ActiveAdmin.register Event do

 before_action :set_schedule
 belongs_to :schedule
 config.batch_actions = false
 before_filter :skip_sidebar!, :only => :index
 permit_params :activity, :place,:start_time,:end_time,:schedule_id, :is_active
 navigation_menu :default
 menu false
 
  index do
    selectable_column
    id_column
    column :activity
    column :place
    column :start_time
    column :end_time
    column :schedule
    column :is_active
    actions
  end

  controller do
    def index
      if params[:id]
        @schedule = Schedule.find(params[:id])
        @events = @schedule.events.page(params[:page]).per(10)
      end
      index!
    end

    def new
      @event = Event.new
    end

    def show
      @page_title = " Event Details"
    end

    private
    def set_schedule
      @schedule = Schedule.find(params[:schedule_id])
    end
  end

  index do
    selectable_column
    id_column
    column :activity
    column :place
    column :start_time
    column :end_time
    column :schedule
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Event Details' do
      f.input :activity
      f.input :place
      f.input :start_time, :as => :string, :input_html => {:class => 'timepicker'}
      f.input :end_time, :as => :string, :input_html => {:class => 'timepicker'}
      f.input :is_active
    end
    f.actions
  end
end