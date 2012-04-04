class PfGroupRatesController < ApplicationController

  before_filter :param_pf_group_id, :only => [:index, :show, :new, :edit]
  before_filter :find_pf_group_rate, :only => [:update, :destroy]

  def index
    @pf_group_rates = PfGroupRate.where(:pf_group_id => @param_pf_group_id).order('paymonth_id DESC,created_at DESC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # salary_sheet.html.haml
      format.json { render json: @pf_group_rates }
    end
  end

  def show
    @pf_group_rate = PfGroupRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @pf_group_rate }
    end
  end

  def new
    @pf_group_rate = PfGroupRate.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @pf_group_rate }
    end
  end

  def edit
    @pf_group_rate = PfGroupRate.find(params[:id])
  end

  def create
    @param_pf_group_id = params[:pf_group_rate][:pf_group_id]
    @pf_group_rate = PfGroupRate.new(params[:pf_group_rate])
    effective_date = Paymonth.find(params[:pf_group_rate][:paymonth_id]).from_date
    respond_to do |format|
      if @pf_group_rate.save
        last_saved = PfGroupRate.find(@pf_group_rate.id)
        last_saved.update_attribute(:effective_date,effective_date)
        format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully created.' }
        format.json { render json: @pf_group_rate, status: :created, location: @pf_group_rate }
      else
        format.html { render 'new' }
        format.json { render json: @pf_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @param_pf_group_id = params[:pf_group_rate][:pf_group_id]
    respond_to do |format|
      if @pf_group_rate.update_attributes(params[:pf_group_rate])
        format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render 'edit' }
        format.json { render json: @pf_group_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @param_pf_group_id = @pf_group_rate.pf_group_id
    @pf_group_rate.destroy

    respond_to do |format|
      format.html { redirect_to pf_group_rates_url(:params1 => @param_pf_group_id), notice: 'Pf group rate was successfully Destroyed.' }
      format.json { head :ok }
    end
  end

  protected
    def param_pf_group_id
      @param_pf_group_id = params[:params1]
    end

    def find_pf_group_rate
      @pf_group_rate = PfGroupRate.find(params[:id])
    end
end
