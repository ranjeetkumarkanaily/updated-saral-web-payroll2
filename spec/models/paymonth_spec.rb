require 'spec_helper'

describe Paymonth do
  before(:each) do
    @attr = {
        :month_year => 24144,
        :number_of_days => 31,
        :from_date => "2011-12-01",
        :to_date => "2011-12-31",
        :month_name => "Dec/2011"
    }
  end

  it "should require a month_name" do
    no_name_month = Paymonth.new(@attr.merge(:month_name => ""))
    no_name_month.should_not be_valid
  end

  it "accepts valid month_name" do
    months = %w[jan-2011 JAN/2011 jAN\2011]
    months.each do |month|
      valid_month = Paymonth.new(@attr.merge(:month_name => month))
      valid_month.should be_valid
    end
  end

  it "rejects invalid month_name" do
    months = %w[jan,2011 JiN:2111 Jan*9911 111.2222]
    months.each do |month|
      invalid_month = Paymonth.new(@attr.merge(:month_name => month))
      invalid_month.should_not be_valid
     end
  end

  it "rejects duplicate month_name" do
    Paymonth.create!(@attr)
    duplicate_month_name = Paymonth.new(@attr)
    duplicate_month_name.should_not be_valid
  end

  it "rejects month_name identical up to case" do
    upcased_month_name = @attr[:month_name].upcase
    Paymonth.create!(@attr.merge(:month_name => upcased_month_name))
    duplicate_month_name = Paymonth.new(@attr)
    duplicate_month_name.should_not be_valid
  end

  describe "find_days_in_month" do
    it "should find days for the given month" do
      paymonth = Paymonth.new(@attr)
      number_days = Paymonth.find_days_in_month 2011, 12
      number_days.should eq(paymonth.number_of_days)
    end
  end

  describe "find_last_day_of_the_month" do
    it "should find last day of the given month" do
      paymonth = Paymonth.new(@attr)
      to_date = Paymonth.find_last_day_of_the_month 2011, 12
      to_date.should eq(paymonth.to_date)
    end
  end

  describe "find_month_number" do
    it "should find month number for the given month name" do
      months = %w[jan feb mar apr may jun jul aug sep oct nov dec]
      month_number_counter = 1
     months.each do |month|
       month_number = Paymonth.find_month_number month
       month_number.should eq(month_number_counter)
       month_number_counter = month_number_counter+1
     end

    end
  end

end
