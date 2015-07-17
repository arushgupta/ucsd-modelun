class Overview < ActiveRecord::Base
  
  belongs_to :category
  has_many :deadlines
  has_many :schedules
  has_many :faqs
  validates :year, presence: true, length: { maximum: 4 }

  def to_s
    session
  end
end
