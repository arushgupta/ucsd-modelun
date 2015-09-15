class Page < ActiveRecord::Base
  belongs_to :category
   
  attr_accessor :page_icon_url
  mount_uploader :page_icon_url, ImageUploader
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: {scope: :category,
	                       message: "Should be one per Category"}
  validates :category, presence: true
  validates :summary, length: { maximum: 200 }
  validates :content, length: { maximum: 5000 }
  validates :meta_keywords, length: { maximum: 100 }
  validates :meta_title, length: { maximum: 50 }
  validates :page_description, length: { maximum: 150 }
  validates :subheading, length: {maximum: 57}
  
  def display_name
    "#{category.name}_#{name}"
  end
end
