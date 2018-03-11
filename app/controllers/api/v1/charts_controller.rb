class Api::V1::ChartsController < Api::ApplicationController
before_action :authenticate_user!

  def index
      user = current_user
      month = params[:start_date]&.to_datetime&.month || DateTime.now.month
      current_month_rec = user.records.where('extract(month from start_time) = ?', month)
      pairs = {}

      current_month_rec.each do |r|
          r.exercises.each do |e|
              if pairs[e.name].present?
                pairs[e.name] += 1
              else
                pairs[e.name] = 1
              end
          end
      end
      render json: pairs
  end

end
