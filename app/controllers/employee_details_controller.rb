class EmployeeDetailsController < ApplicationController
  # GET /employee_details
  # GET /employee_details.json
  def index
    @employee_details = EmployeeDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_details }
    end
  end

  # GET /employee_details/1
  # GET /employee_details/1.json
  def show
    @employee_detail = EmployeeDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_detail }
    end
  end

  # GET /employee_details/new
  # GET /employee_details/new.json
  def new
    @employee_detail = EmployeeDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_detail }
    end
  end

  # GET /employee_details/1/edit
  def edit
    @employee_detail = EmployeeDetail.find(params[:id])
  end

  # POST /employee_details
  # POST /employee_details.json
  def create
    @employee_detail = EmployeeDetail.new(params[:employee_detail])

    respond_to do |format|
      if @employee_detail.save
        format.html { redirect_to @employee_detail, notice: 'Employee detail was successfully created.' }
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
        format.html { redirect_to @employee_detail, notice: 'Employee detail was successfully updated.' }
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
