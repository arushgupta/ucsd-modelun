ActiveAdmin.register Page do

menu priority: 2
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
permit_params :name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_deleted

form do |f|
    f.inputs 'Page Details' do
      f.input :name
      f.input :summary
      f.input :content
      f.input :meta_keywords
      f.input :meta_title
      f.input :category_id
      f.input :is_deleted
    end
    f.actions
  end

end
