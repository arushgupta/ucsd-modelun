class Committee < ActiveRecord::Base

  has_many :topics
  belongs_to :category

  # attr_accessor :topic_guide_url
  mount_uploader :topic_guide_url, FileUploader
  attr_accessor :image_url
  mount_uploader :image_url, ImageUploader
  
  validates :category, presence: true
  validates :order_id, presence: true, uniqueness: {scope: :category,
                         message: "Should be one per Conference."}
  validates :committee_name, presence: true, uniqueness: {scope: :category,
                         message: "Should be one per Conference."}, length: { maximum: 100 }
  validates :chair, presence: true, length: { maximum: 100 }
  validates :vice_chair, presence: true, length: { maximum: 100 }
  def display_name
  "#{category.name}"
 end
end
