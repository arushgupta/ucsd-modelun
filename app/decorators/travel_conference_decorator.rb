class TravelConferenceDecorator < Draper::Decorator
  delegate_all

  def travel_team_image_url
    h.image_tag model.travel_team_image_url_url
  end
end