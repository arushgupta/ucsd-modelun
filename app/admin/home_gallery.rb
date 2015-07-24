ActiveAdmin.register HomeGallery do

permit_params :image_url,:image_text,:button_url,:button_text,:title
decorate_with HomeGalleryDecorator
before_filter :skip_sidebar!, :only => :index
config.batch_actions = false

controller do
    def show
      @page_title = "HomeGallery"
    end
  end

form do |f|
    f.inputs "HomeGallery Details" do
      f.input :image_url, :as => :file,:image_preview => true,label: "image (size 1400x730)"#,:hint => f.object.id? ? image_tag(f.object.image_url.url) : ""
      f.input :image_text
      f.input :title
      f.input :button_url
      f.input :button_text
    end
    f.actions
  end
end
