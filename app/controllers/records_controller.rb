class RecordsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :find_record, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def new
      @record = Record.new(start_time: params[:date])
      @record.exercises.build

      get_user_pairs
      get_latest_pair
      # this is the helper method defined below private
      # this has to be placed in create 'else' when new is rendered again

    end

    def create
      @record = Record.new record_params
      @record.user = current_user

      if @record.save
        flash[:notice] = " ADDED!"
        # redirect_to user_path(current_user)
        redirect_to record_path(Record.last)
      else
        get_user_pairs
        get_latest_pair
        render :new
      end
    end

    def index
      @records = Record.order(created_at: :desc)
      @user_records = current_user.records.order(created_at: :desc) if current_user
    end

    def show

    end

    def edit
      get_user_pairs
    end

    def update
      if @record.update record_params
        redirect_to record_path(@record)
      else
        get_user_pairs
        render :edit
      end
    end

    def destroy
      @record.destroy
      redirect_to user_path(current_user)
    end

    private

    def record_params
      # params.require(:record).permit(:duration, :date, :note, { exercise_ids: [] })
      params.require(:record).permit(
        :date,
        :note,
        :start_time,
        exercises_attributes:[:id, :name, :colour, :_destroy])

    end

    def find_record
      @record = Record.find params[:id]
    end

    def authorize_user!
      unless can?(:crud, @record)
        flash[:alert] = 'Access Denied!'
        redirect_to home_path
      end
    end

    def get_user_pairs
      # if user_signed_in?
        user_pairs = {}
        # all the exercise:colour pairs of a user
        current_user&.reload
        current_user&.records.each do |r|
          r.exercises.each do |e|
            user_pairs[e.name] = e.colour
          end
        end
        @user_pairs = user_pairs
        @user_pair_string = user_pairs.to_json
      # end
    end

    def get_latest_pair
      latest_pair = {}
      current_user&.reload
      current_user&.records.last.exercises.each do |e|
        latest_pair[e.name] = e.colour
      end
      @latest_pair = latest_pair.to_json
    end
end
