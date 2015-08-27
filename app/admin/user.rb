ActiveAdmin.register User do

  menu parent: "Settings"
  before_filter :skip_sidebar!, only: :index
  permit_params :first_name, :last_name, :email, :is_active

  controller do
    def show
      @page_title = "User"
    end
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :is_active
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :is_active
    end
    f.actions
  end
end