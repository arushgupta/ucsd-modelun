class SecretariatsController < ApplicationController
	def index
		@categories = Category.all.where(is_active: true).order('created_at ASC')
        @cat = Category.all.where("categories.category_id IS NOT NULL")
        @apply = ApplyNow.all
		@secretariats=Secretariat.all.where(is_active: true)
	end
end
 