class PtRatesController < ApplicationController

  before_filter :find_pt_rates, :only => [:edit, :update, :destroy]

  def index
    if params[:paymonth_id] && params[:pt_group_id]
      @pt_group_id = params[:pt_group_id]
      @pt_group = PtGroup.find @pt_group_id
      @paymonth_id = params[:paymonth_id]
      @pt_rates = PtRate.where("paymonth_id = #{params[:paymonth_id]} AND pt_group_id = #{params[:pt_group_id]}").order('min_sal_range ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @pt_rates = PtRate.order('min_sal_range ASC').paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pt_rates }
    end
  end

  def new
    @pt_rate = PtRate.new(:paymonth_id => params[:paymonth_id], :pt_group_id => params[:pt_group_id])

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pt_rate }
    end
  end

  def edit

  end

  def create
    @pt_rate = PtRate.new(params[:pt_rate])

    respond_to do |format|
      if @pt_rate.save

        format.html { redirect_to pt_rates_path(:paymonth_id =>  @pt_rate.paymonth_id, :pt_group_id => @pt_rate.pt_group_id), notice: 'Pt rate was successfully created.' } #@pt_rate redirect_to pt_group_path(:id => @pt_group_rate.pt_group_id)
        format.json { render json: @pt_rate, status: :created, location: @pt_rate }
      else
        format.html { render 'new' }
        format.json { render json: @pt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pt_rate.update_attributes(params[:pt_rate])
        format.html { redirect_to pt_rates_path(:paymonth_id =>  @pt_rate.paymonth_id, :pt_group_id => @pt_rate.pt_group_id), notice: 'Pt rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @pt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    paymonth_id = @pt_rate.paymonth_id
    pt_group_id = @pt_rate.pt_group_id
    @pt_rate.destroy

    respond_to do |format|
      format.html { redirect_to pt_rates_path(:paymonth_id =>  paymonth_id, :pt_group_id => pt_group_id) }
      format.json { head :ok }
    end
  end

  protected
    def find_pt_rates
      @pt_rate = PtRate.find(params[:id])
    end
end
