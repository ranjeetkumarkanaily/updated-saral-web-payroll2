class SalaryGroupDetailsController < ApplicationController
  # GET /salary_group_details
  # GET /salary_group_details.json
  def index
    @salary_group_details = SalaryGroupDetail.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @salary_group_details }
    end
  end

  # GET /salary_group_details/1
  # GET /salary_group_details/1.json
  def show
    @salary_group_detail = SalaryGroupDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @salary_group_detail }
    end
  end

  # GET /salary_group_details/new
  # GET /salary_group_details/new.json
  def new
    @salary_group_detail = SalaryGroupDetail.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @salary_group_detail }
    end
  end

  # GET /salary_group_details/1/edit
  def edit
    @salary_group_detail = SalaryGroupDetail.find(params[:id])
  end

  # POST /salary_group_details
  # POST /salary_group_details.json
  def create
    @salary_group_detail = SalaryGroupDetail.new(params[:salary_group_detail])

    respond_to do |format|
      if @salary_group_detail.save
        format.html { redirect_to @salary_group_detail, notice: 'Salary group detail was successfully created.' }
        format.json { render json: @salary_group_detail, status: :created, location: @salary_group_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @salary_group_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salary_group_details/1
  # PUT /salary_group_details/1.json
  def update
    @salary_group_detail = SalaryGroupDetail.find(params[:id])

    respond_to do |format|
      if @salary_group_detail.update_attributes(params[:salary_group_detail])
        format.html { redirect_to @salary_group_detail, notice: 'Salary group detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary_group_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_group_details/1
  # DELETE /salary_group_details/1.json
  def destroy
    @salary_group_detail = SalaryGroupDetail.find(params[:id])
    @salary_group_detail.destroy

    respond_to do |format|
      format.html { redirect_to salary_group_details_url }
      format.json { head :ok }
    end
  end
end
