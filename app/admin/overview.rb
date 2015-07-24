ActiveAdmin.register Overview do
menu priority: 4
permit_params :session, :year, :date, :location, :number, :category_id, :is_active
before_filter :skip_sidebar!, :only => :index
before_filter :skip_sidebar!, :only => :index
controller do
    def show
      @page_title = "Overview Details"
    end
    # def name
    #  "overview"
    # end
    # alias_method :to_s, :name
  end
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
    column :is_active
    column :session
    column :year
    column :date
    column :location
    actions
end

form do |f|
    f.inputs "Overview Details" do
<<<<<<< HEAD
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]}
      f.input :is_active
      f.input :session, :as => :select, :collection => ["select","Fall","Spring","Summer1","Summer2","Winter"]
      f.input :year, :as => :select , :collection => (2010..2030)
=======
      f.input :category, :collection => Category.all.map {|category| [category.name, category.id]},:include_blank => "select"
      f.input :session, :as => :select, :collection => ["Fall","Spring","Summer1","Summer2","Winter"],:include_blank => "select"
      f.input :year, :as => :select , :collection => (2010..2030),:include_blank => "none"
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
      f.input :date,:as => :string, :input_html => {:class => 'datepicker'}
      f.input :location
    end
    f.actions
  end
  # show do
  #   attributes_table do
  #     row :category, :collection => Category.all.map {|category| [category.name, category.id]}
  #     row :session
  #     row :year
  #     row :date
  #     row :location
  #     row :number
  #     row :created_at
  #     row :updated_at
  #     end
  #   end 

end