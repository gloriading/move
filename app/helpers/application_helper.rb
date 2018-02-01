module ApplicationHelper

  def asset_exists?(asset_name)
    Rails.application.assets.find_asset(asset_name).present?
  end


end
