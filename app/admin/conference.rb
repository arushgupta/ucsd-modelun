ActiveAdmin.register Conference do
menu priority: 4
permit_params :session,:year,:date,:location,:delegation_fee,:early,:regular,:late,:number,:reg_url, :branch_id
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
    column :session
    column :year
    column :date
    column :location
    column :delegation_fee
    column :early
    column :regular
    column :late
    column :number
    column :branch,:collection => Branch.all.map {|c| [c.name,c.id]}
    column :reg_url
    actions
  end
end
