class TrainingSessionDecorator < Draper::Decorator
  delegate_all

  def committee_image_url
    h.image_tag model.committee_image_url_url
  end
  def topic_image_url
  	h.image_tag model.topic_image_url_url
  end
end
