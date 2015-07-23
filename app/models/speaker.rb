class Speaker < ActiveRecord::Base
	validates :name,:presence => true,:format => { :with => /\A[a-zA-Z_\-]+\z/},length: { maximum: 100}
	validates :panel,:presence => true,:format => { :with => /\A[a-zA-Z0-9_\-]+\z/},length: { maximum: 100}
	validates :description,:presence => true,:format => { :with => /\A[a-zA-Z0-9_\-]+\z/},length: { maximum: 500}
end
