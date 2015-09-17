ActiveAdmin.register Deadline do

  menu priority: 6
  menu parent: "Conferences"
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  config.sort_order = 'id_asc'
  permit_params :date, :deadline_info, :phase_id, :fee, :category_id, :is_active

  controller do
    def show
      @page_title = "Deadline Details"
    end
  end

  index do
    selectable_column
    id_column
    column 'Information' do |finder|
      finder.deadline_info
    end
    column :date
    column :phase_id
    column :fee
    column :category
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Deadlines Details' do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :phase_id, as: :select, collection: Deadline.phase_ids, include_blank: "select"
      f.input :date, as: :string, input_html: {class: "datepicker"}
      f.input :fee, label: "Fee"
      f.input :deadline_info, label: "Information"
      f.input :is_active, label: "Active"
    end
    actions
  end    
end