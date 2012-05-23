Given /^User have Classification Heading (.*?) created$/ do |heading_name|
  ClassificationHeading.create(classification_heading_name: heading_name, display_order: 1)
  puts ClassificationHeading.all.inspect
end

Given /^User have classification (.*?) created under (.*?)$/ do |classification_name, heading_name|
  classification_heading = ClassificationHeading.create(classification_heading_name: heading_name, display_order: 1)
  Classification.create(:classification_heading_id=> classification_heading.id, classification_name: classification_name)
  puts Classification.all.inspect
end

