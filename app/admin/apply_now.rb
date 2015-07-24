ActiveAdmin.register ApplyNow do
permit_params :title,:button_url,:button_text
before_filter :skip_sidebar!, :only => :index
config.batch_actions = false
controller do
    def show
      @page_title = " Apply"
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


end
