ActiveAdmin.register TravelConference do

  menu priority: 13
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :name, :short_name, :season, :year, :location, :host, :category_id, :start_date, :end_date, :is_active, awards_attributes: [:award, :award_count, :is_active, :_destroy]
 
  controller do
    def show
      @page_title = "Travel Conference"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :short_name
    column :season
    column :year
    column :location
    column :category
    column :is_active
    column 'Awards' do |finder|
      link_to "Add Awards", admin_travel_conference_awards_path(travel_conference_id: finder)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :short_name
      row :season
      row :year
      row :location
      row :category
      row :is_active
      row 'Awards' do |finder|
        link_to "Add Awards", admin_travel_conference_awards_path(travel_conference_id: finder)
      end
    end
  end

  form do |f|
    f.inputs "Upcoming Conferences" do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :name
      f.input :short_name 
      f.input :season, as: :select, collection: ["Fall", "Spring", "Summer", "Winter"], include_blank: "select"
      f.input :year, as: :select , collection: (2008..2030), include_blank: "none"
      f.input :start_date, as: :string, input_html: {class: 'datepicker'}
      f.input :end_date, as: :string, input_html: {class: 'datepicker'}
      f.input :location
      f.input :host
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
