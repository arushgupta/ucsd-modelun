class Schedule < ActiveRecord::Base
	belongs_to :category
	has_many :events
	validates :name,  presence: true, length: { maximum: 100 }, uniqueness: {scope: :category,
	                       message: "Should be one per Category"}
    validates :category, presence: true
    validates :date, presence: true
    validate :date_validation

  def date_validation
    if date < Date.today
      errors[:date] << "Date cannot be set to a past date."
      return false
    else
      return true
    end
  end  

  def display_name
  "#{category.name}_#{name}"
  end 
end
