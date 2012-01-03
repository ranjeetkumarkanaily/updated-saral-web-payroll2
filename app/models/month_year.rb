class MonthYear < ActiveRecord::Base

  regex_for_date = /(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)(-|.|\/|\\)(19|20)\d\d/i

  validates :month_name,   :presence   => true,
                    :format     => { :with => regex_for_date },
                    :uniqueness => { :case_sensitive => false }

  def self.find_days_in_month year, month
    (Date.new(year, 12, 31) << (12-month)).day
  end

  def self.find_last_day_of_the_month year, month
     d = Date.new(year, month,01)
     d += 42
     Date.new(d.year, d.month) - 1
  end

  def self.find_month_number month_name
    month_name = month_name.downcase
    case month_name
      when 'jan'
        month_number = 1
      when 'feb'
        month_number = 2
      when 'mar'
        month_number = 3
      when 'apr'
        month_number = 4
      when 'may'
        month_number = 5
      when 'jun'
        month_number = 6
      when 'jul'
        month_number = 7
      when 'aug'
        month_number = 8
      when 'sep'
        month_number = 9
      when 'oct'
        month_number = 10
      when 'nov'
        month_number = 11
      when 'dec'
        month_number = 12
    end
    month_number
  end
end
