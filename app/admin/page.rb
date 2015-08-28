ActiveAdmin.register Page do

  menu priority: 2
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :name, :summary, :content, :meta_keywords, :meta_title, :subheading, :page_description, :page_icon_url, :info_page, :category_id, :is_active
  
  controller do
    def show
      @page_title = "Page Details"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :summary
    column (:content) {|page| raw(page.content)}
    column (:subheading) {|page| raw(page.subheading)}
    column (:page_description) {|page| raw(page.page_description)}
    column :page_icon_url
    column :info_page
    column :category
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :summary
      row (:content) {|page| raw(page.content)}
      row :meta_keywords
      row :meta_title
      row (:subheading) {|page| raw(page.subheading)}
      row (:page_description) {|page| raw(page.page_description)}
      row :page_icon_url
      row :info_page
      row :category
      row :is_active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Page Details" do
      f.input :category, collection: Category.all.map {|category| [category.name, category.id]}, include_blank: "select"
      f.input :name
      f.input :summary
      f.input :content, as: :ckeditor
      f.input :subheading
      f.input :page_description, as: :ckeditor
      f.input :meta_keywords
      f.input :meta_title
      f.input :page_icon_url, as: :file, image_preview: true, label: "Icon (size 500x500)", hint: f.object.id? ? image_tag(f.object.page_icon_url) : ""
      f.input :info_page
      f.input :is_active
    end
    f.actions
  end
end
