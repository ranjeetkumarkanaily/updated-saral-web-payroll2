class EmployeeDetailsController < ApplicationController
  # GET /employee_details
  # GET /employee_details.json
  require 'will_paginate/array'

  def index
    @paramempid = params[:param1]
    if @paramempid
    @employee_details = EmployeeDetail.where(:employee_id=>@paramempid).paginate(:page => params[:page], :per_page => 10)
    else
    @employee_details = EmployeeDetail.paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @employee_details }
    end
  end

  # GET /employee_details/1
  # GET /employee_deta  ils/1.json
  def show
    @paramempid = params[:param2]
    @employee_detail = EmployeeDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @employee_detail }
    end
  end

  # GET /employee_details/new
  # GET /employee_details/new.json
  def new
    @paramempid = params[:param1]
    @employee_detail = EmployeeDetail.new()

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @employee_detail }
    end
  end

  # GET /employee_details/1/edit
  def edit
    @paramempid = params[:param1]
    @employee_detail = EmployeeDetail.find(params[:id])
  end

  # POST /employee_details
  # POST /employee_details.json
  def create
    @employee_detail = EmployeeDetail.new(params[:employee_detail])

    respond_to do |format|
      if @employee_detail.save
        sal_gr_id = @employee_detail.salary_group_id
        SalaryGroupDetail.all(:conditions => [ "salary_group_id = ?", sal_gr_id]).each do |sgd|
        SalaryAllotment.create!(:employee_id => @employee_detail.employee_id, :employee_detail_id => @employee_detail.id, :effective_date => @employee_detail.effective_date, :salary_head_id => sgd.salary_head_id, :salary_allotment =>0)
        end
        format.html { redirect_to employee_details_path(:param1 => params[:employee_detail]['employee_id']), notice: 'Employee detail was successfully created.' }
        format.json { render json: @employee_detail, status: :created, location: @employee_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_details/1
  # PUT /employee_details/1.json
  def update
    @employee_detail = EmployeeDetail.find(params[:id])
    respond_to do |format|
      if @employee_detail.update_attributes(params[:employee_detail])
        format.html { redirect_to employee_details_path(:param1 => params[:employee_detail]['employee_id']), notice: 'Employee detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_details/1
  # DELETE /employee_details/1.json
  def destroy
    @employee_detail = EmployeeDetail.find(params[:id])
    @employee_detail.destroy

    respond_to do |format|
      format.html { redirect_to employee_details_url }
      format.json { head :ok }
    end
  end
end
