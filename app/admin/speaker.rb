ActiveAdmin.register Speaker do
permit_params :panel,:name,:description
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
index do
selectable_column
    id_column
    column :name
    column :panel
    column :description
    actions
end

end
