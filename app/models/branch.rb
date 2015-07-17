class Branch < ActiveRecord::Base
has_many :conferences
validates :name, presence: true, length: { maximum: 50 }
end
