ActiveAdmin.register History do

  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :year, :description, :is_active, :category_id
  
  controller do
    def show
      @page_title = "History"
    end
  end

  index do
    selectable_column
    id_column
    column :year
    column (:description) {|history| raw(history.description)}
    column :category
    column :is_active
    actions
  end
  
  show do
  	attributes_table do
  	  row :id
  	  row :year
  	  row :description
  	  row :category
  	  row :is_active
  	end
  end

  form do |f|
    f.inputs "History Details" do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :year, as: :select , collection: (2008..2030), include_blank: "none"
      f.input :description, as: :ckeditor
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
