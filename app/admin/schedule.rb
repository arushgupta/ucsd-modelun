ActiveAdmin.register Schedule do

menu priority: 15
permit_params :category_id ,:name ,:date, :is_active, event_attributes: [:activity, :place, :datetime, :time_start, :time_end, :_destroy]
before_filter :skip_sidebar!, :only => :index

  index do
    selectable_column
    id_column
    column :name
    column :date
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :is_active
    column '' do |schedule|
      link_to "Events", admin_schedule_events_path(:schedule_id => schedule)
    end
    actions
  end
  
  form do |f|
    f.inputs 'Schedule Details' do
      f.input :name
      f.input :date, :as => :string, :input_html => {:class => "datepicker"}
      f.input :category, :collection => Category.all.map {|c| [c.name,c.id]},:include_blank => "select"
      f.input :is_active
    end
    f.actions
  end
end
