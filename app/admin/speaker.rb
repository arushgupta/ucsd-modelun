ActiveAdmin.register Speaker do

  menu priority: 7
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :panel, :name, :description, :is_active, :category_id

  controller do
    def show
      @page_title = "Speaker Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :panel
    column :description
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Speaker Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :name
      f.input :panel
      f.input :description
      f.input :is_active
    end
    f.actions
  end
end
