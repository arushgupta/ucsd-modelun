ActiveAdmin.register TravelConference do

  permit_params :name, :short_name, :season, :year, :date, :location, :host, :category_id
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
    column :date
    column :location
    column :category_id
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Upcoming Conferences" do
      f.input :name
      f.input :short_name 
      f.input :season
      f.input :year, :as => :select , :collection => (2010..2030),:include_blank => "none"
      f.input :date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :location
      f.input :host
    end
    f.actions
  end
end
