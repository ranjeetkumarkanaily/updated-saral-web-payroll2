class SalaryHeadsController < ApplicationController

  before_filter :find_salary_head, :only => [:edit, :update, :destroy]

  def index
    @salary_head_earnings = SalaryHead.salary_heads_by_type("Earnings").paginate(:page => params[:page], :per_page => 10)
    @salary_head_deductions = SalaryHead.salary_heads_by_type("Deductions").where('id != 2 and id != 3').paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @salary_heads }
    end
  end

  def new
    @salary_head = SalaryHead.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @salary_head }
    end
  end

  def edit

  end

  def create
    @salary_head = SalaryHead.new(params[:salary_head])

    respond_to do |format|
      if @salary_head.save
        format.html { redirect_to salary_heads_url, notice: 'Salary head was successfully created.' }
        format.json { render json: @salary_head, status: :created, location: @salary_head }
      else
        format.html { render 'new' }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @salary_head.update_attributes(params[:salary_head])
        format.html { redirect_to salary_heads_url, notice: 'Salary head was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @salary_head.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @salary_head.destroy

    respond_to do |format|
      format.html { redirect_to salary_heads_url }
      format.json { head :ok }
    end
  end

  protected
  def find_salary_head
    @salary_head = SalaryHead.find(params[:id])
  end
end
