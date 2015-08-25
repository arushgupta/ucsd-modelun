ActiveAdmin.register Icon do

  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :overview_icon, :sechedule_icon, :commitee_icon, :speaker_icon, :fee_icon, :faq_icon, :category_id

  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column :category
  #   column :is_active
  #   column 'Questions' do |faq|
  #     link_to "Add Questions", admin_faq_questions_path(faq_id: faq)
  #   end
  #   actions
  # end

  # show do
  #   attributes_table do
  #     row :name
  #     row :category
  #     row :is_active
  #     row 'Questions' do |faq|
  #       link_to "Add Questions", admin_faq_questions_path(faq_id: faq)
  #     end
  #   end
  # end

  form do |f|
    f.inputs 'Icon Details' do
    	f.input :category, collection: Category.all.map {|c| [c.name, c.id]}, include_blank: "select"
      f.input :overview_icon, as: :file
      f.input :sechedule_icon, as: :file
      f.input :commitee_icon, as: :file
      f.input :speaker_icon, as: :file
      f.input :fee_icon, as: :file
      f.input :faq_icon, as: :file
    end
    f.actions
  end

end