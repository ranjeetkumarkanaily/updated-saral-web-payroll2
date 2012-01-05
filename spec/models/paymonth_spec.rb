require 'spec_helper'

describe Paymonth do
  before(:each) do
    @attr = {
        :month_year => 24133,
        :number_of_days => 31,
        :from_date => "2011-01-01",
        :to_date => "2011-01-31",
        :month_name => "Jan/2011"
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
      number_days = Paymonth.find_days_in_month 2011, 01
      number_days.should eq(paymonth.number_of_days)
    end
  end

  describe "find_last_day_of_the_month" do
    it "should find last day of the given month" do
      paymonth = Paymonth.new(@attr)
      to_date = Paymonth.find_last_day_of_the_month 2011, 01
      to_date.should eq(paymonth.to_date)
    end
  end

  describe "find_month_details_to_save" do
    it "should find month number for the given month name" do
      paymonth = Paymonth.new(@attr)
      details_to_save = Paymonth.find_month_details_to_save "Jan/2011"
      details_to_save.should eq([paymonth.month_year,paymonth.number_of_days,paymonth.from_date,paymonth.to_date,paymonth.month_name])
    end
  end

  describe "proceed_to_save" do
    it "should return true if valid month entered" do
      paymonth = Paymonth.new(@attr)
      res = Paymonth.proceed_to_save paymonth.month_name
      res.should eq(true)
    end

    it "should return false if invalid month entered" do
      paymonth = Paymonth.create!(@attr)
      res = Paymonth.proceed_to_save "nov/2011"
      res.should eq(false)
    end

  end

  describe "find_month_year" do
    it "should find month year for the given month n year string" do
      paymonth = Paymonth.new(@attr)
       month_year = Paymonth.find_month_year paymonth.month_name
      month_year.should eq(['Jan',2011])
    end
  end

end
