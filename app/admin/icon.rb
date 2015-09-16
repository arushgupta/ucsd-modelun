ActiveAdmin.register Icon do

  before_filter :skip_sidebar!, only: :index
  menu priority: 5
  config.batch_actions = false
  permit_params :overview_icon, :schedule_icon, :committee_icon, :speaker_icon, :fee_icon, :faq_icon, :training_session_icon, :alumni_icon, :secretariats_icon, :galleries_icon, :travel_conferences_icon, :awards_icon, :history_icon, :category_id
  decorate_with IconDecorator

  show do
    attributes_table do
      row :id
      row :overview_icon
      row :schedule_icon
      row :committee_icon
      row :speaker_icon
      row :speaker_icon
      row :faq_icon
      row :training_session_icon
      row :travel_conferences_icon
      row :awards_icon
      row :alumni_icon
      row :galleries_icon
      row :secretariats_icon
      row :history_icon
    end
  end

  form do |f|
    f.inputs 'Icon Details' do
    	f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :overview_icon, as: :file, image_preview: true, label: "Overview (size 210x200)", hint: f.object.id? ? image_tag(f.object.overview_icon) : ""
      f.input :schedule_icon, as: :file, image_preview: true, label: "Schedule (size 210x200)", hint: f.object.id? ? image_tag(f.object.schedule_icon) : ""
      f.input :committee_icon, as: :file, image_preview: true, label: "Committee (size 210x200)", hint: f.object.id? ? image_tag(f.object.committee_icon) : ""
      f.input :speaker_icon, as: :file, image_preview: true, label: "Speaker (size 210x200)", hint: f.object.id? ? image_tag(f.object.speaker_icon) : ""
      f.input :fee_icon, as: :file, image_preview: true, label: "Fee (size 210x200)", hint: f.object.id? ? image_tag(f.object.fee_icon) : ""
      f.input :faq_icon, as: :file, image_preview: true, label: "FAQs (size 210x200)", hint: f.object.id? ? image_tag(f.object.faq_icon) : ""
      f.input :training_session_icon, as: :file, image_preview: true, label: "Training (size 210x200)", hint: f.object.id? ? image_tag(f.object.training_session_icon) : ""
      f.input :travel_conferences_icon, as: :file, image_preview: true, label: "Conerence (size 210x200)", hint: f.object.id? ? image_tag(f.object.travel_conferences_icon) : ""
      f.input :awards_icon, as: :file, image_preview: true, label: "Awards (size 210x200)", hint: f.object.id? ? image_tag(f.object.awards_icon) : ""
      f.input :alumni_icon, as: :file, image_preview: true, label: "Alumni (size 210x200)", hint: f.object.id? ? image_tag(f.object.alumni_icon) : ""
      f.input :galleries_icon, as: :file, image_preview: true, label: "Galleries (size 210x200)", hint: f.object.id? ? image_tag(f.object.galleries_icon) : ""
      f.input :secretariats_icon, as: :file, image_preview: true, label: "Secretariats (size 210x200)", hint: f.object.id? ? image_tag(f.object.secretariats_icon) : ""
      f.input :history_icon, as: :file, image_preview: true, label: "History (size 210x200)", hint: f.object.id? ? image_tag(f.object.history_icon) : ""
    end
    f.actions
  end

end