class StaticPagesController < ApplicationController
  before_filter :find_category
  def index
    @homeimg = HomeGallery.where(is_home_img: true)
    @secretariats = Secretariat.where(is_active: true).first(3)
    @applynows = ApplyNow.where(is_active: true)
    @sponsors = Sponsor.where(is_active: true)
    @members = member_counter
    @user = User.new
    @secretariat = secretariat_counter
    @awards = awards_counter
    cat = Category.where(name: "conference")
    # @cats=cat.first.categories.count
    @conferences = Category.where("categories.category_id IS NOT NULL").all.count + 12
  end 
  
  def home
    @categories = Category.all.where(category_id: nil)
  end

  def help
  end

  def about
  end

  private
    def find_category
      @categories = Category.all.where(is_active: true).order('created_at ASC')
      @cat = Category.all.where("categories.category_id IS NOT NULL")
      @apply = ApplyNow.all
    end

    def member_counter
      if User.all.count < 50
        return 50
      else
        return User.all.count
      end
    end
    
    def secretariat_counter
      if Secretariat.all.count < 10
        return 10
      else
        return Secretariat.all.count
      end
    end

    def awards_counter
      count = 0
      Award.all.each do |award|
        count += award.award_count
      end
      if count < 38
        return 38
      else
        return count
      end
    end
end
