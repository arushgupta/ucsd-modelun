class Page < ActiveRecord::Base
  
  belongs_to :category
 
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: {scope: :category,
	                       message: "should be one per category"}
  validates :category, presence: true
  validates :summary, length: { maximum: 200 }
  validates :content, length: { maximum: 500 }
  validates :meta_keywords, length: { maximum: 100 }
  validates :meta_title, length: { maximum: 50 }

end
