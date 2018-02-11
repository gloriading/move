class Api::V1::RecordsController < Api::ApplicationController
  before_action :authenticate_user!

    def index
      user = current_user
      user_records = user.records.order(created_at: :desc)
      
    end

end
