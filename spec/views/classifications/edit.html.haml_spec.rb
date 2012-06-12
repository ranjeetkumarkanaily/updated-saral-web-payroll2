require 'spec_helper'

describe "classifications/edit" do
  before(:each) do
    classification_heading = FactoryGirl.create(:classification_heading)
    @classification = assign(:classification, stub_model(Classification,
      :classification_heading_id => classification_heading.id,
      :classification_name => "MyString"
    ))
    assign(:heading_name,ClassificationHeading.find(classification_heading.id).classification_heading_name)
  end

  it "renders the edit classification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classifications_path(@classification), :method => "post" do
      assert_select "input#classification_classification_heading_id", :name => "classification[classification_heading_id]"
      assert_select "input#classification_classification_name", :name => "classification[classification_name]"
    end
  end
end
