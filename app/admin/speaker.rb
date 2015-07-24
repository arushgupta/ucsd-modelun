ActiveAdmin.register Speaker do
permit_params :panel,:name,:description, :is_active
before_filter :skip_sidebar!, :only => :index
<<<<<<< HEAD
menu priority: 7
=======
controller do
    def show
      @page_title = "Speaker Details"
    end
  end
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
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
    column :is_active
    actions
end
<<<<<<< HEAD

form do |f|
    f.inputs 'Speaker Details' do
      f.input :name
      f.input :panel
      f.input :description
      f.input :is_active
    end
    f.actions
  end

=======
form do |f|
    f.inputs "Speaker Details",multipart: true do
      f.input :name
      f.input :panel
      f.input :description
    end
    f.actions
  end
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
end
