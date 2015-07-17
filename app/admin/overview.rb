ActiveAdmin.register Overview do
menu priority: 4
menu parent: "Others"
permit_params :session, :year, :date, :location, :delegation_fee, :early_fee, :regular_fee, :late_fee, :number, :category_id
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
    column :early_fee
    column :regular_fee
    column :late_fee
    column :number
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    actions
end
end