class SalariesController < ApplicationController
  def new

  end
  def index

  end

  def create

  end

  def edit
    @salary_detail = Salary.find(params[:id])
  end
end