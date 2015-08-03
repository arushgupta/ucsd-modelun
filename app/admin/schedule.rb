ActiveAdmin.register Schedule do

  menu priority: 15
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :category_id ,:name ,:date, :is_active, event_attributes: [:activity, :place,  :start_time, :end_time, :is_active, :_destroy]

  controller do
    def show
      @page_title = "Schedule Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :date
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :is_active
    column 'Events' do |schedule|
      link_to "Add Events", admin_schedule_events_path(:schedule_id => schedule)
    end
    actions
  end
  
  form do |f|
    f.inputs 'Schedule Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name,c.id]},:include_blank => "select"
      f.input :name
      f.input :date, :as => :string, :input_html => {:class => "datepicker"}
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
