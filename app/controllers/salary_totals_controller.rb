class SalaryTotalsController < ApplicationController

  def index
    @salary_totals = SalaryTotal.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @salary_totals }
    end
  end

  def create

  end

  def update

  end

end
