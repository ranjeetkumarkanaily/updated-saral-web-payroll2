Given /^Given valid state (.*?) created$/ do |state|
  @state=State.create(:state_name=> state)
end

Given /^User have PT Group (.*?) created$/ do |state|
  PtGroup.create(:name=> state, :state_id=> @state.id, :certificate_no=>"123", pto_circle_no: "123456", address: "Bangalore", return_period: "Monthly")
end

Then /^PT Group "(.*?)" should be deleted$/ do |value|
  PtGroup.delete(value)
end

Given /^User have PT Group month (.*?) created under PT Group (.*?)$/ do |month,pt_grp|
  month=Paymonth.create(month_name: month)
  pt_group=PtGroup.create(:name=> pt_grp, :state_id=> @state.id, :certificate_no=>"123", pto_circle_no: "123456", address: "Bangalore", return_period: "Monthly")
  pt_grp_rate=PtGroupRate.create(pt_group_id: pt_group.id, paymonth_id: month.id)
  #PtRate.create(pt_group_id: pt_group.id, paymonth_id: month.id, min_sal_range: 20000, max_sal_range: nil, pt: 200)
end

Given /^User have PT Group month (.*?) created with PT Group (.*?)$/ do |month,pt_grp|
  month=Paymonth.create(month_name: month)
    pt_group=PtGroup.create(:name=> pt_grp, :state_id=> @state.id, :certificate_no=>"123", pto_circle_no: "123456", address: "Bangalore", return_period: "Monthly")
    pt_grp_rate=PtGroupRate.create(pt_group_id: pt_group.id, paymonth_id: month.id)
    PtRate.create(pt_group_id: pt_group.id, paymonth_id: month.id, min_sal_range: 20000, max_sal_range: nil, pt: 200)
end

Then /^PtRates count decreased by (\d+)$/ do |arg1|
  PtRate.count.should == arg1.to_i-1
end

Then /^Pt group count should get increased by (\d+)$/ do |count|
  PtGroup.count.should == count.to_i
end

Then /^PT group rate count should get increased by (\d+)$/ do |count|
  PtGroupRate.count.should == count.to_i
end


