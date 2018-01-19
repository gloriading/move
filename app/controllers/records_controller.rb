class RecordsController < ApplicationController
    before_action :find_record, only: [:show, :edit, :update, :destroy]

    def new
      @record = Record.new
    end

    def create
      @record = Record.new record_params
      if @record.save
        redirect_to records_path
      else
        render :new
      end
    end

    def index
      @records = Record.order(date: :desc)
    end

    def show

    end

    def edit
    end

    def update
      if @record.update record_params
        redirect_to record_path(@record)
      else
        render :edit
      end
    end

    def destroy
      @record.destroy
      redirect_to records_path       
    end

    private

    def record_params
      params.require(:record).permit(:duration, :date, :note)
    end

    def find_record
      @record = Record.find params[:id]
    end

end
