class HolidaysController < ApplicationController
  # GET /holidays
  # GET /holidays.json
  require 'will_paginate/array'

  def index
    if params[:attendance_configuration]
      @holidays = Holiday.order('holiday_date ASC').search(params[:attendance_configuration]).paginate(:page => params[:page], :per_page => 10)
    else
      @holidays = Holiday.where('attendance_configuration_id = 1').order('holiday_date ASC').paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @holidays }
    end
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @holiday }
    end
  end

  # GET /holidays/new
  # GET /holidays/new.json
  def new
    @holiday = Holiday.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @holiday }
    end
  end

  # GET /holidays/1/edit
  def edit
    @holiday = Holiday.find(params[:id])
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.new(params[:holiday])
    chk_existing_holiday = Holiday.existing_holiday @holiday
    if chk_existing_holiday.count > 0
      @holiday = Holiday.new
      @holiday.errors.add(:holiday, " already assigned for selected date and selected Attendance Head")
      respond_to do |format|
        format.html { render action: "new"}
      end
    else
      respond_to do |format|
        if @holiday.save
          format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
          format.json { render json: @holiday, status: :created, location: @holiday }
        else
          format.html { render action: "new" }
          format.json { render json: @holiday.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /holidays/1
  # PUT /holidays/1.json
  def update
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to holidays_url }
      format.json { head :ok }
    end
  end
end
