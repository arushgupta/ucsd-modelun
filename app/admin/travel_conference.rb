ActiveAdmin.register TravelConference do

permit_params :name, :short_name, :season, :year, :location, :host, :category_id, :start_date, :end_date, :is_active
before_filter :skip_sidebar!, :only => :index
menu :priority => 13
config.batch_actions = false
 
  controller do
    def show
      @page_title = " Travel Conference"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :short_name
    column :season
    column :year
    column :location
    column :category_id
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Upcoming Conferences" do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :name
      f.input :short_name 
      f.input :season, :as => :select, :collection => ["Fall", "Spring", "Summer", "Winter"], :include_blank => "select"
      f.input :year, :as => :select , :collection => (2010..2030),:include_blank => "none"
      f.input :start_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :end_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
      f.input :host
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
