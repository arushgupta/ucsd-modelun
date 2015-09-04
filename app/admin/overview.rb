ActiveAdmin.register Overview do
  
  menu priority: 4
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :season, :delegation_fee, :position_paper_deadline, :welcome_letter, :start_date, :end_date, :location, :registration_form_url, :category_id, :is_active

  controller do
    def show
      @page_title = "Overview Details"
    end
  end

  index do
    selectable_column
    id_column
    column :season
    column :start_date
    column :end_date
    column :location
    column :registration_form_url
    column :delegation_fee
    column :position_paper_deadline
    column (:welcome_letter)  {|overview| raw(overview.welcome_letter)}
    column :category
    column :is_active
    actions
  end
  
  show do
    attributes_table do
      row :season
      row :start_date
      row :end_date
      row :location
      row :registration_form_url
      row 'Delegation Fee' do |finder|
        finder.delegation_fee
      end
      row 'Position Paper Deadline' do |finder|
        finder.position_paper_deadline
      end
      row (:welcome_letter) {|overview| raw(overview.welcome_letter)}
      row :category
      row :is_active
    end
  end

  form do |f|
    f.inputs "Overview Details" do
      f.input :category, collection: Category.all.map {|category| [category.name, category.id]}, include_blank: "select"
      f.input :season, as: :select, collection: ["Fall", "Spring", "Summer", "Winter"], include_blank: "select"
      f.input :delegation_fee, label: "Delegation Fee (in $)"
      f.input :position_paper_deadline, as: :string, input_html: {class: 'datepicker'}
      f.input :start_date, as: :string, input_html: {class: 'datepicker'}
      f.input :end_date, as: :string, input_html: {class: 'datepicker'}
      f.input :location
      f.input :registration_form_url
      f.input :welcome_letter, as: :ckeditor
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end