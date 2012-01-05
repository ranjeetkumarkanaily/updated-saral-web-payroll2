class PaymonthsController < ApplicationController
  def index
    @paymonths = Paymonth.all
  end

  def show
    @paymonth = Paymonth.find(params[:id])
  end

  def new
    @paymonth = Paymonth.new
  end

  def edit
    @paymonth = Paymonth.find(params[:id])
  end

  def create
    tmp_month_year = params[:paymonth]
    month_year =  tmp_month_year[:month_name]
    month_string = month_year[0,3]
    year = month_year[4,7].to_i
    month = Paymonth.find_month_number month_string
    number_of_days = Paymonth.find_days_in_month year,month
    from_date = Date.new(year,month,01)
    to_date = Paymonth.find_last_day_of_the_month year,month
    month_year_digit = ((year*12)+month)
    month_name = month_string+'/'+year.to_s
    @paymonth = Paymonth.new(:month_year => month_year_digit,:number_of_days => number_of_days,:from_date => from_date,:to_date => to_date,:month_name => month_name)

    respond_to do |format|
      if @paymonth.save
        format.html { redirect_to @paymonth, notice: 'Paymonth was successfully created.' }
        format.json { render json: @paymonth, status: :created, location: @paymonth }
      else
        format.html { render action: "new" }
        format.json { render json: @paymonth.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @paymonth = Paymonth.find(params[:id])

    respond_to do |format|
      if @paymonth.update_attributes(params[:paymonth])
        format.html { redirect_to @paymonth, notice: 'Paymonth was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @paymonth.errors, status: :unprocessable_entity }
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
        format.html { redirect_to paymonths_url }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { render action: "index", notice: 'Paymonth can not be delete.' }
      end
    end


  end
end
