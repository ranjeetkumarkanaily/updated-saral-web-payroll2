Given /^User have paymonth (.*?) created$/ do |arg1|
  Paymonth.create!(:month_year=> 24145, :number_of_days=> 31, :from_date=> "2010-12-01", :to_date=> "2010-12-31", :month_name=> arg1)
end

And /^User should see paymonth "(.*?)" details$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
Then /^paymonth "(.*?)" should be deleted$/ do |value|
  Paymonth.delete(value)
end