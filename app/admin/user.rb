ActiveAdmin.register User do

menu parent: "Settings"
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
permit_params :name, :email, :password, :is_active

index do
    selectable_column
    id_column
    column :name
    column :email
    column :password
    column :is_active
    actions
end

form do |f|
    f.inputs 'User Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :is_active
    end
    f.actions
  end


end
