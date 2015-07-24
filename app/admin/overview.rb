ActiveAdmin.register Overview do
  
  menu priority: 4
  permit_params :season, :start_date, :end_date, :location, :category_id, :is_active
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false

  controller do
    def show
      @page_title = "Overview Details"
    end
  end

  index do
    selectable_column
    id_column
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :season
    column :start_date
    column :end_date
    column :location
    column :is_active
    actions
  end

  form do |f|
    f.inputs "Overview Details" do
      f.input :is_active
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]}, :include_blank => "select"
      f.input :season, :as => :select, :collection => ["Fall", "Spring", "Summer", "Winter"], :include_blank => "select"
      f.input :start_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :end_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
    end
    f.actions
  end
end