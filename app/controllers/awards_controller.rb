class AwardsController < ApplicationController
  def index
  	@categories = Category.all.where(is_active: true)
    @cat = Category.all.where("categories.category_id IS NOT NULL")
    @travelconferences = TravelConference.all
    # awards = TravelConference.where(travel_conference_id: params[:id]).to_a.count
    @awards = Award.all.where(is_active: true).to_a
  end
end
