class Committee < ActiveRecord::Base

  has_many :topics
  belongs_to :category
end
