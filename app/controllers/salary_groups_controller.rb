class SalaryGroupsController < ApplicationController

  before_filter :find_salary_groups, :only => [:edit, :update, :destroy]

  def index
    @salary_groups = SalaryGroup.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @salary_groups }
    end
  end

  def new
    @salary_group = SalaryGroup.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @salary_group }
    end
  end

  def create
    @salary_group = SalaryGroup.new(params[:salary_group])

    respond_to do |format|
      if @salary_group.save
        format.html { redirect_to salary_groups_url, notice: 'Salary group was successfully created.' }
        format.json { render json: @salary_group, status: :created, location: @salary_group }
      else
        format.html { render 'new' }
        format.json { render json: @salary_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @salary_group.update_attributes(params[:salary_group])
        format.html { redirect_to salary_groups_url, notice: 'Salary group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @salary_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @salary_group = SalaryGroup.find(params[:id])
    @salary_group.destroy

    respond_to do |format|
      format.html { redirect_to salary_groups_url }
      format.json { head :ok }
    end
  end

  protected
    def find_salary_groups
      @salary_group = SalaryGroup.find(params[:id])
    end
end
