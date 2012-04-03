class PtGroupRatesController < ApplicationController

  before_filter :find_pt_group_rates, :only => [:show, :edit, :update, :destroy]

  def index
    @pt_group_rates = PtGroupRate.all

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pt_group_rates }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pt_group_rate }
    end
  end

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
        format.html { render action: "new" }
        format.json { render json: @pt_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pt_group_rate.update_attributes(params[:pt_group_rate])
        format.html { redirect_to @pt_group_rate, notice: 'Pt group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pt_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pt_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to pt_group_rates_url }
      format.json { head :ok }
    end
  end

  protected
    def find_pt_group_rates
      @pt_group_rate = PtGroupRate.find(params[:id])
    end
end
