class Deadline < ActiveRecord::Base
	belongs_to :category
	enum phase_id: { "delegation_fee" => 1,"early_fee"=> 2, "regular_fee"=> 3,"late_fee"=> 4}
	validates :category,presence: true
	validates :date, :presence => true
	#just_define_datetime_picker :date
	#validates :phase_id ,:presence => true

	validates :text,:presence => true, :format => { :with => /\A[a-zA-Z\s\.',:(){}_\-]+\z/}

# 	def phase_id_enum
#    [['Active', 1],['Pending',0],['Banned',2]]
# end
def phase_id=(value)
    self[:phase_id] = value.to_i
end
end
