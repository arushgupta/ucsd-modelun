ActiveAdmin.register ApplyNow do

  permit_params :title,:button_url,:button_text
  before_filter :skip_sidebar!, :only => :index
  config.batch_actions = false

  controller do
    def show
      @page_title = " Apply"
    end
  end
end
