class Api::V1::RecordsController < Api::ApplicationController
  before_action :authenticate_user!

    def index
      user = current_user
      user_records = user.records.order(created_at: :desc)
      all_exe = {}
        user_records.each do |r|
            r.exercises.each do |e|
                if all_exe[e.name].present?
                  all_exe[e.name] += 1
                else
                  all_exe[e.name] = 1
                end
            end
        end
        render json: all_exe
    end

end
