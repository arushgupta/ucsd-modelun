class Overview < ActiveRecord::Base
  
  belongs_to :category
  has_many :deadlines
  has_many :schedules
  has_many :faqs
  #validates :year, presence: true, length: { maximum: 4 }
  #validates :session,presence: true
  validates :category,presence: true
  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}
  #validates :number,:format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }

  def to_s
    session
  end
end
