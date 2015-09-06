class SponsorDecorator < Draper::Decorator
  delegate_all

  def logo_url
    h.image_tag model.logo_url_url
  end
end
