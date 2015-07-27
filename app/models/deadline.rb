class Deadline < ActiveRecord::Base
  
  belongs_to :category
  
  enum phase_id: { "Delegation Fee" => 1,"Early Fee" => 2, "Regular Fee"=> 3,"Late Fee"=> 4}
  validates :category,presence: true
  validates :date, :presence => true
  validates :text,:presence => true, :format => { :with => /\A[a-zA-Z\s\.',:(){}_\-]+\z/}
  validate :date_validation
def phase_id=(value)
   self[:phase_id] = value.to_i
end

def date_validation
  if date < Date.today
    errors[:date] << "cannot be before the today date"
    return false
  else
    return true
  end
end 
end
