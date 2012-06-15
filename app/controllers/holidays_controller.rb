class HolidaysController < ApplicationController
  require 'will_paginate/array'

  before_filter :find_holiday, :only => [:show, :edit, :update, :destroy]

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

  def edit

  end

  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @holiday }
    end
  end

  def new
    @holiday = Holiday.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @holiday }
    end
  end

  def create
    @holiday = Holiday.new(params[:holiday])
    chk_existing_holiday = Holiday.existing_holiday @holiday
    if chk_existing_holiday.count > 0
      @holiday = Holiday.new
      @holiday.errors.add(:holiday, " already assigned for selected date and selected Attendance Head")
      respond_to do |format|
        format.html { render 'new'}
      end
    else
      holiday=params[:holiday]
      date_format=OptionSetting.date_format_value
      if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
        dates_value=[holiday[:holiday_date]]
        dates=OptionSetting.convert_date(dates_value)
        val=holiday.merge!(:holiday_date=>dates[0])
        @holiday = Holiday.new(val)
      else
        @holiday = Holiday.new(params[:holiday])
      end
      respond_to do |format|
        if @holiday.save
          format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
          format.json { render json: @holiday, status: :created, location: @holiday }
        else
          format.html { render 'new' }
          format.json { render json: @holiday.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    date_format=OptionSetting.date_format_value
    if date_format == "%m-%Y-%d" || date_format == "%m/%d/%Y" || date_format == "%d/%m/%y" || date_format == "%d-%m-%y"
      dates_value=[params[:holiday][:holiday_date]]
      dates=OptionSetting.convert_date(dates_value)
      params[:holiday].merge!(:holiday_date=>dates[0])
    else
      params[:holiday]
    end
    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to holidays_url }
      format.json { head :ok }
    end
  end

  protected
    def find_holiday
      @holiday = Holiday.find(params[:id])
    end
end
