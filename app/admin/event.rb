ActiveAdmin.register Event do
 menu priority: 6
 before_action :set_schedule
 # menu parent: "Others"
 belongs_to :schedule
 config.batch_actions = false
 before_filter :skip_sidebar!, :only => :index
 permit_params :activity, :place, :date, :time_start,:time_end,:schedule_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#form do |f|

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do
  selectable_column
  id_column
  column :activity
  column :place
  column :date
  column :time_start
  column :time_end
  column :schedule
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

  private
  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end

form do |f|
  f.inputs 'Event Details' do
      f.input :activity
      f.input :place
      f.input :date, :as => :string, :input_html => {:class => "datepicker"}
      # f.input :schedule, :collection => Schedule.all.map {|c| [c.name,c.id]}
      f.input :time_start, :as => :string, :input_html => {:class => 'timepicker'}
      f.input :time_end, :as => :string, :input_html => {:class => 'timepicker'}
      f.actions
  end
end

end
