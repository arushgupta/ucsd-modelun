class ApplyNowDecorator < Draper::Decorator
  delegate_all

  def image_url
    h.image_tag model.image_url_url
  end
end