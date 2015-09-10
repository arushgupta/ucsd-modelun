class Award < ActiveRecord::Base

  belongs_to :travel_conference
  belongs_to :category
  validates :name, presence: true, length: { maximum: 100 }
end
