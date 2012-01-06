class Paymonth < ActiveRecord::Base

  has_many :pf_esi_rates

  regex_for_date = /(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)(-|\/|\\)(19|20)\d\d/i

  ABBR_MONTHNAMES 	= 	%w(jan feb mar apr may jun jul aug sep oct nov dec)

  validates :month_name,   :presence   => true,
            :format     => { :with => regex_for_date },
            :uniqueness => { :case_sensitive => false }

  def self.find_days_in_month year, month
    (Date.new(year, 12, 31) << (12-month)).day
  end

  def self.find_last_day_of_the_month year, month
    d = Date.new(year, month,01)
    d += 32
    Date.new(d.year, d.month) - 1
  end

  def self.find_month_details_to_save paymonth
    month_year = find_month_year paymonth
    month_string =  month_year[0]
    year =   month_year[1]
    month = ABBR_MONTHNAMES.index(month_string.downcase) + 1
    number_of_days = find_days_in_month year,month
    from_date = Date.new(year,month,01)
    to_date = find_last_day_of_the_month year,month
    month_year_digit = ((year*12)+month)
    month_name = month_string+'/'+year.to_s
    return [month_year_digit,number_of_days,from_date,to_date,month_name]
  end

  def self.proceed_to_save paymonth
    res = true
    param_month_year =  find_month_year paymonth
    param_month_string = param_month_year[0]
    chk = ABBR_MONTHNAMES.index(param_month_string.downcase)
    if chk != nil
      if Paymonth.count > 0
        last_month = Paymonth.last
        last_month_year = find_month_year last_month.month_name
        last_month_string =  last_month_year[0]
        last_saved_month =  ABBR_MONTHNAMES.index(last_month_string.downcase) + 1
        next_month_number = last_saved_month == 11 ? 0 : last_saved_month
        next_month_string =   ABBR_MONTHNAMES[next_month_number]

        res = false if  next_month_string != param_month_string
      end
    else
      res = false
    end

    res
  end

  def self.find_month_year paymonth
    month = paymonth[0,3]
    year = paymonth[4,7].to_i
    return [month,year]
  end
end
