ActiveAdmin.register Icon do

  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :overview_icon, :sechedule_icon, :commitee_icon, :speaker_icon, :fee_icon, :faq_icon, :training_session_icon, :alumni_icon, :secretariats_icon, :galleries_icon, :travel_conferences_icon, :awards_icon, :category_id
  decorate_with IconDecorator

  form do |f|
    f.inputs 'Icon Details' do
    	f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :overview_icon, as: :file, image_preview: true, label: "Overview (size 200x200)", hint: f.object.id? ? image_tag(f.object.overview_icon) : ""
      f.input :sechedule_icon, as: :file, image_preview: true, label: "Schedule (size 200x200)", hint: f.object.id? ? image_tag(f.object.sechedule_icon) : ""
      f.input :commitee_icon, as: :file, image_preview: true, label: "Committee (size 200x200)", hint: f.object.id? ? image_tag(f.object.commitee_icon) : ""
      f.input :speaker_icon, as: :file, image_preview: true, label: "Speaker (size 200x200)", hint: f.object.id? ? image_tag(f.object.speaker_icon) : ""
      f.input :fee_icon, as: :file, image_preview: true, label: "Deadline (size 200x200)", hint: f.object.id? ? image_tag(f.object.fee_icon) : ""
      f.input :faq_icon, as: :file, image_preview: true, label: "FAQs (size 200x200)", hint: f.object.id? ? image_tag(f.object.faq_icon) : ""
      f.input :training_session_icon, as: :file, image_preview: true, label: "Training (size 200x200)", hint: f.object.id? ? image_tag(f.object.training_session_icon) : ""
      f.input :travel_conferences_icon, as: :file, image_preview: true, label: "Travel Conerence (size 200x200)", hint: f.object.id? ? image_tag(f.object.travel_conferences_icon) : ""
      f.input :awards_icon, as: :file, image_preview: true, label: "Awards (size 200x200)", hint: f.object.id? ? image_tag(f.object.awards_icon) : ""
      f.input :alumni_icon, as: :file, image_preview: true, label: "Alumni (size 200x200)", hint: f.object.id? ? image_tag(f.object.alumni_icon) : ""
      f.input :galleries_icon, as: :file, image_preview: true, label: "Galleries (size 200x200)", hint: f.object.id? ? image_tag(f.object.galleries_icon) : ""
      f.input :secretariats_icon, as: :file, image_preview: true, label: "Secretariats (size 200x200)", hint: f.object.id? ? image_tag(f.object.secretariats_icon) : ""
    end
    f.actions
  end

end