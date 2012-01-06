class PfEsiRatesController < ApplicationController
  def index
    if params[:month_year]
      @pfesirate = PfEsiRate.find_by_paymonth_id(params[:month_year])
    end
  end

  def new
    @pfesirate = PfEsiRate.new
  end

  def create
    @pfesirate = PfEsiRate.new(params[:pf_esi_rate])
    respond_to do |format|
      if @pfesirate.save
        format.html { redirect_to @pfesirate, notice: 'Rate was successfully created.' }
        format.json { render json: @pfesirate, status: :created, location: @pfesirate }
      else
        format.html { render action: "new" }
        format.json { render json: @pfesirate.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def delete
  end

end
