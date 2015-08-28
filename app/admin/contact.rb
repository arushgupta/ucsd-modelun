ActiveAdmin.register Contact do

  menu priority: 12
 
  before_filter :skip_sidebar!, only: :index
  config.batch_actions = false
  permit_params :name, :email, :message


end
