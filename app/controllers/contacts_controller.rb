class ContactsController < ApplicationController
	def index
		@categories = Category.all.where(is_active: true).order('created_at ASC')
		@contact = Contact.new
	end

	def create
		contact = Contact.new(contact_params)
		# if verify_recaptacha
		if contact.save
			admin = AdminUser.first
			UserMailer.new_contact_mail(admin, contact).deliver_now
		  flash[:notice] = "Your information is incorrect"
     redirect_to categories_path(id: params[:category_id])
    end
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end
