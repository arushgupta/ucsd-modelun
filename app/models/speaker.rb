class Speaker < ActiveRecord::Base
<<<<<<< HEAD
	validates :name,:presence => true,length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :panel,:presence => true,length: { maximum: 100}# :format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
	validates :description,:presence => true,length: { maximum: 500} # :format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
=======
	validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
	validates :panel,:presence => true,:format => { :with => /\A[a-zA-Z0-9\s\-]+\z/},length: { maximum: 100}
	validates :description,:presence => true,:format => {  :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 500}
>>>>>>> 9e82046c0eebabaff8cd58261247f46586f0aca1
end
