ActiveAdmin.register Faq do
 menu priority: 8
 # debugger
 # has_many :questions
 permit_params :name, :category_id, questions_attributes: [:question, :answer, :id, :_destroy]
controller do
    def show
      @page_title = "Faq Details"
    end
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


index do
  selectable_column
  id_column
  column :name
  column :category
  
  # column "FAQs" do |site|
  #   link_to "FAQs (#{site.faqs.count})", :controller => "edit_qa", :action => "index", 'q[site_id_eq]' => "#{site.id}".html_safe
  column '' do |faq|
      #link_to 'Edit Q&A', admin_question_path(:faq_id => 2)
       link_to "Questions", admin_faq_questions_path(:faq_id => faq)#, :id => faq.questions) # "Questions",  :controller => "faqs/questions", admin_questions_path(q: { faq_id_eq: faq.id}), 'q[faq_id_eq]' => "#{faq.id}".html_safe
  end
  actions
end
# link_to "Questions", :controller => "questions", :id => faq, 'q[faq_id_eq]' => "#{faq.id}".html_safe

form do |f|
    f.inputs 'FAQs Details' do
      f.input :name
      f.input :category, :collection => Category.all.map {|c| [c.name, c.id]},:include_blank => "select"
    end
      # f.has_many :questions do |q|
      #   q.input :question
      #   q.input :answer, :as => :ckeditor
      # end
    f.actions
end

# show do
#   # default_main_content
#   attributes_table do
#     default_attribute_table_rows.each do |field|
#       row field
#     end
    
#     h4 "Q&As"

#     table_for faq.questions do
#      column "ID",              :id
#      column "Questions",       :question
#      column "Answers",         :answer
#     end
#   end

 # Other ways to make tables
    # rows 'Q&A' do |n|
    #   row faq.questions.map(&:question).join("<br />").html_safe
    #   row faq.questions.map(&:answer).join("<br />").html_safe
    # end  

  # columns do
    
  #   column max_width: "100px", min_width: "50px" do
  #     h3 "ID"
  #     h5 faq.questions.map(&:id).join("<br />").html_safe
  #   end

  #   column do
  #     h3 "Questions"
  #     # row do |n|
  #       h5 faq.questions.map(&:question).join("<br />").html_safe
  #     # end
  #   end

  #   column do
  #     h3 "Answers"
  #     # row do |n|
  #       h5 faq.questions.map(&:answer).join("<br />").html_safe
  #     # end
  #   end
  # end
    # panel "FAQ Questions" do
  #   render partial: "questions", locals: {faq: faq}
  # end

  # panel "FAQ Answers" do
  #   render partial: "answers",    locals: {faq: faq}
  # end


    # row 'Question' do |n|
    #   faq.questions.map(&:question).join("<br />").html_safe
    # end  
    # row 'Answer' do
    #   faq.questions.map(&:answer).join("<br />").html_safe
    # end

# end
end

