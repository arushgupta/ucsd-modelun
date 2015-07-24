ActiveAdmin.register Committee do

  menu priority: 14
  permit_params :order, :committee, :topic, :chair, :vice_chair, :image, :description, :category_id, :is_active
  before_filter :skip_sidebar!, :only => :index
  
  controller do
    def show
      @page_title = "Faq Details"
    end
  end

  index do
    selectable_column
    id_column
    column :order
    column :committee
    column :topic
    column :chair
    column :vice_chair
    column :image
    column :description
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Committee Details' do
      f.input :order
      f.input :committee
      f.input :topic
      f.input :chair
      f.input :vice_chair
      f.input :image, :as => :file, :image_preview => true, label: "image (size 500x500)", :hint => f.object.id? ? image_tag(f.object.image.url) : ""
      f.input :description, :as => ckeditor
      f.input :is_active
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
    end
    f.actions
  end


end
