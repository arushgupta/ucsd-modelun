class PageDecorator < Draper::Decorator
  delegate_all

  def page_icon_url
    h.image_tag model.page_icon_url_url
  end
end