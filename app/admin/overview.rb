ActiveAdmin.register Overview do
menu priority: 4
permit_params :session, :year, :date, :location, :number, :category_id
before_filter :skip_sidebar!, :only => :index
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
# controller do
#    def number_to_currency(number, options = {})
#   options[:locale] ||= I18n.locale
#   super(number, options)
# end
# end
index do
    selectable_column
    id_column
    column :category, :collection => Category.all.map {|c| [c.name,c.id]}
    column :session
    column :number
    column :year
    column :date
    column :location
    actions
end

form do |f|
    f.inputs "Overview Details" do
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]}
      f.input :session, :as => :select, :collection => ["select","Fall","Spring","Summer1","Summer2","Winte r"]
      f.input :year, :as => :select , :collection => (2010..2030)
      f.input :date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
      f.input :number 
    end
    f.actions
  end
  show do
    attributes_table do
      row :category, :collection => Category.all.map {|category| [category.name, category.id]}
      row :session
      row :year
      row :date
      row :location
      row :number
      row :created_at
      row :updated_at
      end
    end 

end