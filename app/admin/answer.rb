ActiveAdmin.register Answer do
menu priority: 10
permit_params :content ,:question_id
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
    column :content
    column :question,:collection => Question.all.map {|c| [c.content,c.id]}
    actions
  end
form do |f|
    f.inputs 'answer Details' do
      f.input :content
      f.input :question,:collection => Question.all.map {|c| [c.content,c.id]}
    end
    f.actions
  end

end
