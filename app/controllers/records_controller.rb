class RecordsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_record, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def new
      @record = Record.new(start_time: params[:date])
      @record.exercises.build

      get_user_pairs
      get_latest_pair
    end

    def create
      @record = Record.new record_params
      @record.user = current_user

      if @record.save
        flash[:success] = "Record has been created successfully."
        redirect_to record_path(Record.last)
      else
        get_user_pairs
        get_latest_pair
        render :new
      end
    end

    def index
      # Limit the scope: don't use Record.all
      @records = current_user.records.order(created_at: :desc)
    end

    def show
    end

    def edit
      get_user_pairs
    end

    def update
      if @record.update record_params
        flash[:success] = "Record has been updated successfully."
        redirect_to @record
      else
        get_user_pairs
        render :edit
      end
    end

    def destroy
      if @record.destroy
        flash[:info] = 'Record has been destroyed'
        redirect_to user_path(current_user)
      else
        flash[:warning]= 'Destroy failed.'
        redirect_to user_path(current_user)
      end
    end

    private

    def record_params
      params.require(:record).permit(
        :date,
        :note,
        :start_time,
        exercises_attributes:[:id, :name, :colour, :workout_id, :_destroy])

    end

    def find_record
      # Security concern
      @record = current_user.records.find params[:id]
    end

    def authorize_user!
      unless can?(:crud, @record)
        flash[:danger] = 'Access Denied!'
        redirect_to home_path
      end
    end

    def get_user_pairs
        user_pairs = {}
        # all the exercise:colour pairs of a user
        current_user&.reload
        # N+1 query
        # Exercise.where(record_id: current_user.record_ids)...
        current_user&.records.each do |r|
          r.exercises.each do |e|
            user_pairs[e.name] = e.colour
          end
        end
        @user_pairs = user_pairs
        @user_pair_string = user_pairs.to_json
    end

    def get_latest_pair
      latest_pair = {}
      current_user&.reload
      # current_user.records.last
      # SELECT * FROM records WHERE user_id = 1 ORDER BY id DESC LIMIT 1;
      # _.exercises
      # SELECT * FROM exercises WHERE record_id = 999;
      current_user&.records&.last&.exercises&.each do |e|
        latest_pair[e.name] = e.colour
      end
      @latest_pair = latest_pair.to_json
    end
end
