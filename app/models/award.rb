class Award < ActiveRecord::Base

  belongs_to :travel_conference
  belongs_to :category
end
