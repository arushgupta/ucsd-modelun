class Category < ActiveRecord::Base
 has_many :pages
 has_many :categories #, class_name: "Category",
 #                      #    foreign_key: "category_id"
 belongs_to :category #, class_name: "Category"

end
