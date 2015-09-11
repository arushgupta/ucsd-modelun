ActiveAdmin.register AdminUser do
  
  menu parent: "Settings"
  before_filter :skip_sidebar!, :only => :index
  permit_params :email, :password, :password_confirmation

  controller do 
    def update
      UserMailer.change_password_mail(current_admin_user).deliver_now
      super
    end 
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
