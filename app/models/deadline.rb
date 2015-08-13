class Deadline < ActiveRecord::Base
  
  belongs_to :category
  
  enum phase_id: { "Delegation Fee" => 1,"Early Delegate Fee" => 2, "Regular Delegate Fee"=> 3,"Late Delegate Fee"=> 4}
  validates :category, presence: true
  validates :date, presence: true
  validates :deadline_info, presence: true, :format => { :with => /\A[a-zA-Z\s\.',:(){}_\-]+\z/}
  validate :date_validation
  
  def phase_id=(value)
   self[:phase_id] = value.to_i
  end

  def display_name
    "#{id}"
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
