class ContactsController < ApplicationController
	def index
		@categories = Category.all.where(is_active: true).order('created_at ASC')
		@contact = Contact.new
	end

	def create
		contact = Contact.new(contact_params)
		# if verify_recaptacha
# <<<<<<< HEAD
# 		if contact.save
# 			admin = AdminUser.first
# 			UserMailer.new_contact_mail(admin, contact).deliver_now
# 		  flash[:notice] = "Your information is incorrect"
#      redirect_to categories_path(id: params[:category_id])
#     end
# =======
		@contact.save

		flash.keep[:notice] = "Your information saved successfully"
		# flash.now.notice = "Your information saved successfully"
		# flash[:notice] = "Your information saved successfully"
		# flash.clear
		# redirect_to contacts_path
	    # else
	    # flash[:notice] = "Your information is incorrect"
        redirect_to categories_path(id: params[:category_id])
#         # end
# >>>>>>> 517965ab8f0c0128c51b5e466104d4ebbab6df87
	end

	private
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end
