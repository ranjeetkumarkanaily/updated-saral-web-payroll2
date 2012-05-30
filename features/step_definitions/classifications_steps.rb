Given /^User have Classification Heading (.*?) created$/ do |heading_name|
  ClassificationHeading.create(classification_heading_name: heading_name, display_order: 1)
end

Given /^User have classification (.*?) created under (.*?)$/ do |classification_name, heading_name|
  classification_heading = ClassificationHeading.create(classification_heading_name: heading_name, display_order: 1)
  Classification.create(:classification_heading_id=> classification_heading.id, classification_name: classification_name)
end

Then /^ClassificationHeading count should increase by (\d+)$/ do |count|
  ClassificationHeading.count.should == count.to_i
end

Then /^ClassificationHeading count should decrease by (\d+)$/ do |count|
  ClassificationHeading.count.should == count.to_i-1
end

