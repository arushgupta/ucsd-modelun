ActiveAdmin.register Deadline do
menu priority: 6
permit_params :date, :text, :category_id,:phase_id,:fee, :is_active
#menu parent: "Others"
before_filter :skip_sidebar!, :only => :index
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
def phase_id=(value)
    self[:phase_id] = value.to_i
end
index do
    selectable_column
    id_column
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :text
    column :date
    column :phase_id
    column :fee
    column :is_active
    actions
end
form do |f|
    f.inputs 'Deadlines Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}
      f.input :text
      f.input :date,:as => :string, :input_html => {:class => "hasDatetimePicker"}
      f.input :phase_id,as: :select, collection: Deadline.phase_ids
      f.input :fee,label:"fee (in $)"
      f.input :is_active
    end
    actions
end    

end
