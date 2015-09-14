class IconDecorator < Draper::Decorator
  delegate_all

  def overview_icon
    h.image_tag model.overview_icon
  end
  def schedule_icon
  	h.image_tag model.schedule_icon
  end
  def committee_icon
  	h.image_tag model.committee_icon
  end
  def speaker_icon
  	h.image_tag model.speaker_icon
  end
  def fee_icon
  	h.image_tag model.fee_icon
  end
  def faq_icon
  	h.image_tag model.faq_icon
  end
  def training_session_icon
  	h.image_tag model.training_session_icon
  end
  def travel_conferences_icon
  	h.image_tag model.travel_conferences_icon
  end
  def awards_icon
  	h.image_tag model.awards_icon
  end
  def alumni_icon
  	h.image_tag model.alumni_icon
  end
  def galleries_icon
  	h.image_tag model.galleries_icon
  end
  def secretariats_icon
  	h.image_tag model.secretariats_icon
  end
  def history_icon
    h.image_tag model.history_icon
  end
end