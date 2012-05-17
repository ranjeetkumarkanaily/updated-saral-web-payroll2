Given /^User have Classification Heading Hr Details created$/ do
  @cls=ClassificationHeading.create(classification_heading_name: "Hr Details", display_order: 1)
  puts ClassificationHeading.all.inspect
end

Given /^User have classification Family Detail created$/ do
  Classification.create(:classification_heading_id=> @cls.id, classification_name: "Family Details")
  puts Classification.all.inspect
end

Then /^User should go to the classifications page with id$/ do
  visit path_to classifications_path
  #current_path.should == classifications_path(:params1=>@cls.id)
end