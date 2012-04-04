class PtGroupRatesController < ApplicationController

  def new
    @pt_group_id = params[:pt_group_id]
    @ptGroup = PtGroup.find @pt_group_id
    @pt_group_rate = PtGroupRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_group_rate }
    end
  end

  def create
    @pt_group_rate = PtGroupRate.new(params[:pt_group_rate])

    respond_to do |format|
      if @pt_group_rate.save
        format.html { redirect_to pt_group_path(:id => @pt_group_rate.pt_group_id), notice: 'Pt group rate was successfully created.' }
        format.json { render json: @pt_group_rate, status: :created, location: @pt_group_rate }
      else
        format.html { render 'new' }
        format.json { render json: @pt_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

end
