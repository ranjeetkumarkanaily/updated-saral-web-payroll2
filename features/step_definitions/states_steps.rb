Given /^User have state Tamilnadu created$/ do
  State.create(:state_name=> "Tamilnadu")
end

Then /^state "(.*?)" should be deleted$/ do |state|
  State.delete(state)
end

Then /^state count should get increased by (\d+)$/ do |count|
  State.count.should == count.to_i
end