ActiveAdmin.register Question do
 menu priority: 9
 permit_params :question, :answer, :faq_id
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

config.sort_order = 'faq_id_asc'

# menu false

index do
  selectable_column
  id_column
  column :question
  column :answer
  column :faq
  actions
end

form do |f|
    f.inputs 'Question Details' do
      f.input :faq, :collection => FAQ.all.map {|faq| [faq.name, faq.id]}
      f.input :question
      f.input :answer, :as => :ckeditor
      f.actions
   end
end

end
