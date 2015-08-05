ActiveAdmin.register User do

  menu parent: "Settings"
  before_filter :skip_sidebar!, only: :index
  permit_params :name, :email, :password, :is_active

  controller do
    def show
      @page_title = "User"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :password
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :is_active
    end
    f.actions
  end
end