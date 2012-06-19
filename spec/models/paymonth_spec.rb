require 'spec_helper'

describe Paymonth do
  before(:each) do
    @attr = {
        :month_year => 24133,
        :number_of_days => 31,
        :from_date => "2011-01-01",
        :to_date => "2011-01-31",
        :month_name => "jan/2011"
    }
  end

  it { should have_many(:pt_rates)}

  it { should have_many(:pf_group_rates)}

  it { should have_many(:pt_group_rates)}

  it { should have_many(:esi_group_rates)}

  it { should have_many(:every_month_comp_values)}

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

  describe "find_month_details_to_save" do
    it "should find details for the given month name to save" do
      paymonth = Paymonth.new(@attr)
      paymonth_date=Date.strptime(paymonth.month_name,"%b/%Y")
      details_to_save = Paymonth.find_month_details_to_save "jan/2011"
      details_to_save.should eq([paymonth.month_year,paymonth.number_of_days,paymonth_date.beginning_of_month.strftime("%Y-%m-%d"),paymonth_date.end_of_month.strftime("%Y-%m-%d"),paymonth.month_name])
    end
  end

  describe "proceed_to_save" do
    it "should return true if valid month entered" do
      paymonth = Paymonth.new(@attr)
      res = Paymonth.proceed_to_save paymonth.month_name
      res.should eq([true,nil])
    end

    it "should return false if invalid month entered" do
      paymonth = Paymonth.create!(@attr)
      res = Paymonth.proceed_to_save "nov/2011"
      res.should eq([false, "Feb/2011"])
    end

    it "should return true if month entered is jan/2012 and last saved month is dec" do
      paymonth = Paymonth.create! @attr.merge(:month_name => "dec/2011")
      res = Paymonth.proceed_to_save "jan/2012"
      res.should eq([true, "Jan/2012"])
    end

  end

  describe "should give next month" do
    it "should give next month if any paymonth is created" do
      paymonth = Paymonth.create(@attr)
      next_month = Paymonth.next_paymonth
      next_month.should eq("Feb/2011")
    end
  end

end
