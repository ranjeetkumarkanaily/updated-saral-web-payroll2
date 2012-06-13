require 'spec_helper'

describe OptionSetting do


  describe "return the date format" do
    before (:each) do
         @employee=FactoryGirl.create(:employee)
         @date_format=DateFormat.create(:date_format=>"Y-m-d",:date_format_value=>"%Y-%m-%d")
         @opt_setting=OptionSetting.create(:country_id=> "120",:time_zone=>"(GMT+05:30) Kolkata",:currency=>"Rupee",:salary_calc=>"Jan/2012",:date_format=>"Y-m-d")
      end
    it "should return the date foramt for a date" do
      date_value=@employee[:date_of_joining]
      opt_value =1
      res = OptionSetting.date_format_type date_value, opt_value
      res.should eq("2011-02-01")
    end

     it "should return the date foramt" do
       date_value=""
       opt_value =2
       res = OptionSetting.date_format_type date_value, opt_value
       res.should eq("%Y-%m-%d")
     end
  end

  describe "return the date for the format m-Y-d" do
    it "should return the date of m-Y-d to Y-m-d" do
      DateFormat.create(:date_format => "m-Y-d",:date_format_value=>"%m-%Y-%d")
      OptionSetting.create(:salary_calc=>"Jan/2012",:date_format=>"m-Y-d")
      aray=['01-2012-21','02-2011-22','11-2000-23','']
      res = OptionSetting.convert_date aray
      res.should eq(['2012-01-21','2011-02-22','2000-11-23',''])
    end
  end

  describe "return the date for the format m/d/Y" do
    it "should return the date of m/d/Y to Y-m-d" do
      DateFormat.create(:date_format => "m/d/Y",:date_format_value=>"%m/%d/%Y")
      OptionSetting.create(:salary_calc=>"Jan/2012",:date_format=>"m/d/Y")
      aray=['01/21/2012','02/22/2011','11/23/2000','']
      res = OptionSetting.convert_date aray
      res.should eq(['2012-01-21','2011-02-22','2000-11-23',''])
    end
  end

  describe "return the date for the format d/m/y" do
    it "should return the date of d/m/y to Y-m-d" do
      DateFormat.create(:date_format => "d/m/y",:date_format_value=>"%d/%m/%y")
      OptionSetting.create(:salary_calc=>"Jan/2012",:date_format=>"d/m/y")
      aray=['21/01/12','22/02/11','23/11/00','']
      res = OptionSetting.convert_date aray
      res.should eq(['2012-01-21','2011-02-22','2000-11-23',''])
    end
  end
  describe "return the date for the format d-m-y" do
    it "should return the date of d-m-y to Y-m-d" do
      DateFormat.create(:date_format => "d-m-y",:date_format_value=>"%d-%m-%y")
      OptionSetting.create(:salary_calc=>"Jan/2012",:date_format=>"d-m-y")
      aray=['21-01-12','22-02-11','23-11-00','']
      res = OptionSetting.convert_date aray
      res.should eq(['2012-01-21','2011-02-22','2000-11-23',''])
    end
  end
end
