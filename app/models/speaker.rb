class Speaker < ActiveRecord::Base
	validates :name,:presence => true,length: { maximum: 100} # :format => { :with => /\A[a-zA-Z_\-]+\z/},
	validates :panel,:presence => true,length: { maximum: 100}# :format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
	validates :description,:presence => true,length: { maximum: 500} # :format => { :with => /\A[a-zA-Z0-9_\-]+\z/},
end
