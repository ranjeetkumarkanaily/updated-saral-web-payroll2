class SalaryGroupsController < ApplicationController
  # GET /salary_groups
  # GET /salary_groups.json
  def index
    @salary_groups = SalaryGroup.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @salary_groups }
    end
  end

  # GET /salary_groups/1
  # GET /salary_groups/1.json
  def show
    @salary_group = SalaryGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @salary_group }
    end
  end

  # GET /salary_groups/new
  # GET /salary_groups/new.json
  def new
    @salary_group = SalaryGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @salary_group }
    end
  end

  # GET /salary_groups/1/edit
  def edit
    @salary_group = SalaryGroup.find(params[:id])
  end

  # POST /salary_groups
  # POST /salary_groups.json
  def create
    @salary_group = SalaryGroup.new(params[:salary_group])

    respond_to do |format|
      if @salary_group.save
        format.html { redirect_to @salary_group, notice: 'Salary group was successfully created.' }
        format.json { render json: @salary_group, status: :created, location: @salary_group }
      else
        format.html { render action: "new" }
        format.json { render json: @salary_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salary_groups/1
  # PUT /salary_groups/1.json
  def update
    @salary_group = SalaryGroup.find(params[:id])

    respond_to do |format|
      if @salary_group.update_attributes(params[:salary_group])
        format.html { redirect_to @salary_group, notice: 'Salary group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_groups/1
  # DELETE /salary_groups/1.json
  def destroy
    @salary_group = SalaryGroup.find(params[:id])
    @salary_group.destroy

    respond_to do |format|
      format.html { redirect_to salary_groups_url }
      format.json { head :ok }
    end
  end
end
