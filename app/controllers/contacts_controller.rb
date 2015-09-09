class ContactsController < ApplicationController
	def index
		@categories = Category.all.where(is_active: true).order('created_at ASC')
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		# if verify_recaptacha
		@contact.save
		flash.keep[:notice] = "Your information saved successfully"
		# redirect_to contacts_path
	    # else
	    # flash[:notice] = "Your information is incorrect"
        redirect_to categories_path(id: params[:category_id])
        # end
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end
