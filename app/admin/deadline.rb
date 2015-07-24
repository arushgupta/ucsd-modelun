ActiveAdmin.register Deadline do

menu priority: 6
permit_params :date, :text, :category_id,:phase_id,:fee, :is_active
before_filter :skip_sidebar!, :only => :index

  controller do
    def show
      @page_title = "Deadline Details"
    end
  end

  index do
    selectable_column
    id_column
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :text
    column :date
    column :phase_id
    column :fee
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