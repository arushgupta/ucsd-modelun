ActiveAdmin.register Category do

  menu priority: 1
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

  permit_params :name, :category_id, :is_deleted

  index do
    selectable_column
    id_column
    column :name
    column :is_deleted
    column :category#, :collection => Category.all.map {|c| [c.name]}
    actions
  end

  form do |f|
  	f.inputs "Category Details" do
  	  f.input :name
  	  f.input :category, :collection => Category.all.map {|c| [c.name]}
  	  f.input :is_deleted
    end
    f.actions
  end


end