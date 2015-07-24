class TravelConference < ActiveRecord::Base

	belongs_to :category

	validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
    validates :date, :presence => true
    validates :name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
    validates :short_name,:presence => true,:format => { :with => /\A[a-zA-Z\s\-]+\z/},length: { maximum: 100}
end
