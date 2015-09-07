ActiveAdmin.register Sponsor do

  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :name, :logo_url, :is_active, :category_id
  decorate_with SponsorDecorator

  controller do
    def show
      @page_title = "Speaker Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :logo_url
    column :category
    column :is_active
    actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :category
      row :is_active
  	end
  end

  form do |f|
    f.inputs 'Speaker Details' do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :name
      f.input :logo_url, as: :file, image_preview: true, label: "Image (size 500x500)", hint: f.object.id? ? image_tag(f.object.logo_url) : ""
      f.input :is_active, label: 'Active'
  	end
  	f.actions
  end
end
