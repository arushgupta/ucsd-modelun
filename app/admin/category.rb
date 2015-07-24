ActiveAdmin.register Category do

  menu priority: 1
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false

  controller do
    def show
      @page_title = " Category"
    end
  end


  permit_params :name, :category_id, :is_active
  config.sort_order = 'id_asc'
  
  index do
    selectable_column
    id_column
    column :name
    column :is_active
    column :category
    actions
  end

  form do |f|
  	f.inputs "Category Details" do
  	  f.input :name
  	  f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :is_active
    end
    f.actions
  end
end