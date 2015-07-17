ActiveAdmin.register Faq do
 
 menu priority: 8
 permit_params :name, :category_id, questions_attributes: [:question, :answer]

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
  column :category_id
  actions
end

form do |f|
    f.inputs 'FAQs Details' do
      f.input :name
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]}
    end
      f.has_many :questions do |q|
        q.input :question
        q.input :answer, :as => :ckeditor
      end
    f.actions
end
end

#end
