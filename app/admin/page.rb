ActiveAdmin.register Page do
 before_filter :skip_sidebar!, :only => :index
 menu priority: 2
 config.batch_actions = false
  controller do
    def show
      @page_title = "Page Details"
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
  permit_params :name, :summary, :content, :meta_keywords, :meta_title, :category_id, :is_deleted

  index do
    selectable_column
    id_column
    column :name
    column :summary
    column :content
    column :category
    column :is_deleted
    actions
  end

form do |f|
    f.inputs "Page Details" do
      f.input :name
      f.input :summary
      f.input :content, :as => :ckeditor
      f.input :meta_keywords
      f.input :meta_title
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]},:include_blank => "select"
      f.input :is_deleted
    end
    f.actions
  end

end
