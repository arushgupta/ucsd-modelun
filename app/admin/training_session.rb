ActiveAdmin.register TrainingSession do

  menu priority: 8
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :date, :committee, :topic, :description, :image_url, :start_time, :end_time, :topic_guide_url, :category_id, :is_active
  decorate_with TrainingSessionDecorator

  controller do
    def show
      @page_title = " Travel Conference"
    end
  end

  index do
    selectable_column
    id_column
    column :date
    column 'Start Time' do |time|
      time.start_time.to_s.split[1]
    end
    column 'End Time' do |time|
      time.end_time.to_s.split[1]
    end
    column :committee
    column :topic
    column :description
    column 'Image' do |finder|
      finder.image_url
    end
    column 'Topic Guide' do |upload|
      unless upload.topic_guide_url.blank?
        link_to upload.topic_guide_url.file.original_filename, download_training_sessions_path(file: upload.topic_guide_url.file.original_filename )
      end 
    end
    column :category
    column :is_active
    actions
  end

  show do
    attributes_table do
      row :date
      row :start_time
      row :end_time
      row :committee
      row :topic
      row :description
      row :image_url
      row 'Topic Guide' do |upload|
        unless upload.topic_guide_url.blank?
          link_to upload.topic_guide_url.file.original_filename, training_session_download_path(file: upload.topic_guide_url.file.original_filename, training_session_id: upload.id)
        end
      end
      row :category
      row :is_active
    end
  end

  form do |f|
    f.inputs "Upcoming Training Sessions" do
      f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :date, as: :string, input_html: {class: 'datepicker'}
      f.input :start_time, as: :string, input_html: {class: 'timepicker'}
      f.input :end_time, as: :string, input_html: {class: 'timepicker'}
      f.input :committee
      f.input :topic
      f.input :description, as: :ckeditor
      f.input :image_url, as: :file, image_preview: true, label: "Image (size 500x500)", hint: f.object.id? ? image_tag(f.object.image_url) : ""
      f.input :topic_guide_url, as: :file, hint: f.object.id? ? link_to(f.object.topic_guide_url.url): "", label: "Topic Guide (PDF only)"
      f.input :is_active, label: "Active"
    end
    f.actions
  end
end
