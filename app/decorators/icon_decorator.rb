class IconDecorator < Draper::Decorator
  delegate_all

  def overview_icon
    h.image_tag model.overview_icon_url
  end
  def sechedule_icon
  	h.image_tag model.schedule_icon_url
  end
  def commitee_icon
  	h.image_tag model.commitee_icon_url
  end
  def speaker_icon
  	h.image_tag model.speaker_icon_url
  end
  def fee_icon
  	h.image_tag model.fee_icon_url
  end
  def faq_icon
  	h.image_tag model.faq_icon_url
  end
  def training_session_icon
  	h.image_tag model.training_session_icon_url
  end
  def travel_conferences_icon
  	h.image_tag model.travel_conferences_icon_url
  end
  def awards_icon
  	h.image_tag model.awards_icon_url
  end
  def alumni_icon
  	h.image_tag model.alumni_icon_url
  end
  def galleries_icon
  	h.image_tag model.galleries_icon_url
  end
  def secretariats_icon
  	h.image_tag model.secretariats_icon_url
  end
end