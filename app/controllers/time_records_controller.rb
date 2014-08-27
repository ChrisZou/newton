class TimeRecordsController < ApplicationController
  before_action :set_time_record, only: [:show, :edit, :update, :destroy]

  # GET /time_records
  # GET /time_records.json
  def index
    @time_records = TimeRecord.order(:day, :hour, :quarter)
  end

  # GET /time_records/1
  # GET /time_records/1.json
  def show
  end


  def today
      @time_records = TimeRecord.where(day: Date.today)
      @time_records_hash = {}
      @time_records.each do |record|
        @time_records_hash[record.hour.to_s+"-"+record.quarter.to_s] = record.event
      end
  end


  def get_record(day, hour, quarter)
    TimeRecord.where(day: day, hour: hour, quarter: quarter)
  end

  # GET /time_records/new
  def new
    @time_record = TimeRecord.new
  end

  # GET /time_records/1/edit
  def edit
  end

  # POST /time_records
  # POST /time_records.json
  def create
    @time_record = TimeRecord.new(time_record_params) 

    respond_to do |format|
      if @time_record.save
        format.html { redirect_to @time_record, notice: 'Time record was successfully created.' }
        format.json { render :show, status: :created, location: @time_record }
        format.js
      else
        format.html { render :new }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_records/1
  # PATCH/PUT /time_records/1.json
  def update
    respond_to do |format|
      if @time_record.update(time_record_params)
        format.html { redirect_to @time_record, notice: 'Time record was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_record }
      else
        format.html { render :edit }
        format.json { render json: @time_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_records/1
  # DELETE /time_records/1.json
  def destroy
    @time_record.destroy
    respond_to do |format|
      format.html { redirect_to time_records_url, notice: 'Time record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_record
      @time_record = TimeRecord.find(params[:id])
    end

    def get_day_records(day)
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_record_params
      params.require(:time_record).permit(:day, :hour, :quarter, :event, :note)
    end
end
