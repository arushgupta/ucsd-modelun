ActiveAdmin.register TravelConference do
permit_params :name,:short_name,:session,:year,:location,:host,:category_id
before_filter :skip_sidebar!, :only => :index
menu :priority => 13
config.batch_actions = false
 controller do
    def show
      @page_title = " Travel Conference"
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
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
      f.input :season
      f.input :year, :as => :select , :collection => (2010..2030),:include_blank => "none"
      f.input :start_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :end_date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
      f.input :host
      f.input :is_active
    end
    f.actions
  end
end
