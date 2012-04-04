class PaymonthsController < ApplicationController

  before_filter :find_paymonth, :only => [:show, :update]


  def index
    @paymonths = Paymonth.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @paymonth = Paymonth.new
  end

  def show
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @employee }
    end
  end

  def create
    tmp_month_year = params[:paymonth][:month_name]
    if Paymonth.new(:month_name => tmp_month_year).valid?
      res =  Paymonth.proceed_to_save tmp_month_year
      if res[0]
        params_to_save = Paymonth.find_month_details_to_save tmp_month_year
        @paymonth = Paymonth.new(:month_year => params_to_save[0],:number_of_days => params_to_save[1],:from_date => params_to_save[2],:to_date => params_to_save[3],:month_name => params_to_save[4])
        respond_to do |format|
          if @paymonth.save
            format.html {redirect_to paymonths_url, notice: 'Paymonth was successfully created.' }
            format.json { render json: @paymonth, status: :created, location: @paymonth }
          else
            format.html { render 'new' }
            format.json { render json: @paymonth.errors, status: :unprocessable_entity }
          end
        end
      else
        @paymonth = Paymonth.new
        @paymonth.errors.add(:paymonth, "Out of sequence Month/Year can not be created. Next Month to be created is #{res[1]}")
        respond_to do |format|
          format.html { render 'new'}
        end
      end
    else
      @paymonth = Paymonth.new
      @paymonth.errors.add(:paymonth, "is invalid.")
      respond_to do |format|
        format.html { render 'new' }
      end
    end
  end

  def destroy
    first_paymonth = Paymonth.first
    last_paymonth = Paymonth.last

    @paymonth = Paymonth.find(params[:id])

    if( @paymonth.id == first_paymonth.id or @paymonth.id == last_paymonth.id )
      @paymonth.destroy
      respond_to do |format|
        format.html { redirect_to paymonths_url, notice: 'Paymonth was successfully Deleted.'  }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        @paymonth.errors.add(:paymonth, "Out of sequence Month/Year can not be deleted.")
        format.html { redirect_to paymonths_url, notice: "Out of sequence Month/Year can not be deleted." }
      end
    end
  end

  protected
    def find_paymonth
      @paymonth = Paymonth.find(params[:id])
    end
end
