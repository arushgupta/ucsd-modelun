ActiveAdmin.register Deadline do

  menu priority: 6
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false
  permit_params :date, :text, :phase_id, :fee, :category_id, :is_active

  controller do
    def show
      @page_title = "Deadline Details"
    end
  end

  index do
    selectable_column
    id_column
    column :text
    column :date
    column :phase_id
    column :fee
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'Deadlines Details' do
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
      f.input :text
      f.input :date,:as => :string, :input_html => {:class => "datepicker"}
      f.input :phase_id, as: :select, collection: Deadline.phase_ids,:include_blank => "select"
      f.input :fee, label: "Fee (in $)"
      f.input :is_active
    end
    actions
  end    
end