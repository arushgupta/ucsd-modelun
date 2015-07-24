ActiveAdmin.register TravelConference do
permit_params :name,:short_name,:session,:year,:date,:location,:host
before_filter :skip_sidebar!, :only => :index
menu :priority => 13
config.batch_actions = false
controller do
    def show
      @page_title = " TravelConference"
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
form do |f|
    f.inputs "Overview Details" do
      f.input :name
      f.input :short_name 
      f.input :session
      f.input :year, :as => :select , :collection => (2010..2030),:include_blank => "none"
      f.input :date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
      f.input :host
    end
    f.actions
  end

end
