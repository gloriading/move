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
  # def index
  #     user = current_user
  #     month = params[:start_date]&.to_datetime&.month || DateTime.now.month
  #     current_month_rec = user.records.where('extract(month from start_time) = ?', month)
  #     temp1 = {}
  #     temp2 = {}
  #     temp3 = {}
  #     pairs = {}
  #
  #
  #     current_month_rec.each do |r|
  #         r.exercises.each do |e|
  #             if temp1[e.name].present?
  #               temp1[e.name] += 1
  #             else
  #               temp1[e.name] = 1
  #             end
  #         end
  #     end
  #
  #     # puts temp1
  #
  #     temp1.each do |k, v|
  #       temp2[k] = [(v.to_s.split(''))[0].to_i]
  #     end
  #     # puts temp2
  #     # {"trx"=>[1], "hiking"=>[2], "meditate"=>[1], "sleep"=>[2], "weights"=>[1], "walk"=>[3], "swim"=>[2], "running"=>[1], "surfing"=>[1], "jogging"=>[1], "power walk"=>[2], "skiing"=>[1], "boating"=>[1], "racing"=>[1]}
  #     current_month_rec.each do |r|
  #       r.exercises.each do |e|
  #         temp2.each do |k,v|
  #           if k == e.name
  #             v.push(e.duration)
  #           end
  #           # temp3 = temp2.select{|k,v| k == e.name}
  #           # temp3[e.name].push(e.duration)
  #         end
  #       end
  #     end
  #     puts temp2
  #
  #     render json: pairs
  # end

end
