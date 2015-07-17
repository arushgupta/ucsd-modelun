ActiveAdmin.register Schedule do
menu priority: 5
#belongs_to :conference
permit_params :category_id ,:name ,:date
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
    column :category, :collection => Category.all.map {|c| [c.session,c.id]}
    actions
  end
form do |f|
    f.inputs 'schedule Details' do
      f.input :name
      f.input :date
      f.input :category, :collection => Category.all.map {|c| [c.session,c.id]}
    end
    f.actions
  end
end
