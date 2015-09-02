class ContactsController < ApplicationController
	def index
		@categories = Category.all.where(is_active: true)
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if simple_captcha_valid?
		@contact.save
		flash[:notice] = "Your information saved successfully"
		redirect_to contacts_path
	    else
	    flash[:notice] = "Your information is incorrect"
        redirect_to contacts_path
        end
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end
