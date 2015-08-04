ActiveAdmin.register Category do

  menu priority: 1
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :name, :category_id, :is_active
  config.sort_order = 'id_asc'

  controller do
    def show
      @page_title = " Category"
    end
  end
  
  index do
    selectable_column
    id_column
    column :name
    column :category
    column :is_active
    actions
  end

  form do |f|
  	f.inputs "Category Details" do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
  	  f.input :name
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end