ActiveAdmin.register Secretariat do
permit_params :position,:name,:major,:description,:image,:college
decorate_with SecretariatDecorator
before_filter :skip_sidebar!, :only => :index
controller do
    def show
      @page_title = "Secretariat Details"
    end
  end
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
    column :position
    column :college
    column :major
    column :description
    column :image
    actions
end

form do |f|
    f.inputs "Secretariat Details",multipart: true do
      f.input :position
      f.input :name
      f.input :college
      f.input :major
      f.input :description
      f.input :image, :as => :file,:image_preview => true,label: "image (size 500x500)",:hint => f.object.id? ? image_tag(f.object.image.url) : ""
    end
    f.actions
  end
end


