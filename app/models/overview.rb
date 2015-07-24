class Overview < ActiveRecord::Base
  
  belongs_to :category
  has_many :deadlines
  has_many :schedules
  has_many :faqs

  validates :season, presence: true
  validates :category,presence: true
  validates :location,:presence => true, :format => { :with => /\A[a-zA-Z0-9\s\.',:(){}_\-]+\z/},length: { maximum: 100}

  def to_s
    season
  end
end
