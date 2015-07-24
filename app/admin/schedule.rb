ActiveAdmin.register Schedule do
menu priority: 5
#belongs_to :conference
permit_params :category_id ,:name ,:date, event_attributes: [:activity, :place, :datetime, :time_start, :time_end, :_destroy]

menu parent: "Others"
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
    column :date
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    actions
    column '' do |schedule|
      link_to "Events", admin_schedule_events_path(:schedule_id => schedule)
  end
  end
form do |f|
    f.inputs 'Schedule Details' do
      f.input :name
      f.input :date, :as => :string, :input_html => {:class => "hasDatetimePicker"}
      f.input :category, :collection => Category.all.map {|c| [c.name,c.id]},:include_blank => "select"
    end
    f.actions
  end
end
