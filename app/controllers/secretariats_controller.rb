class SecretariatsController < ApplicationController
	def index
		@secretariats=Secretariat.all.where(category_id: params[:id])
	end
end
