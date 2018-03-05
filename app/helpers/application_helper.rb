module ApplicationHelper

  def title(text)
    content_for :title, text
  end

  def asset_exists?(asset_name)
    Rails.application.assets.find_asset(asset_name).present?
  end

end
