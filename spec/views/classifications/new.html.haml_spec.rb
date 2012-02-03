require 'spec_helper'

describe "classifications/new" do
  before(:each) do
    @classification_heading = FactoryGirl.create(:classification_heading)
    assign(:paramclassification_id, @classification_heading.id)
    assign(:classification, stub_model(Classification,
      :classification_heading_id => 1,
      :classification_name => "MyString"
    ).as_new_record)
  end

  it "renders new classification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classifications_path, :method => "post" do
      assert_select "input#classification_classification_heading_id", :name => "classification[classification_heading_id]"
      assert_select "input#classification_classification_name", :name => "classification[classification_name]"
    end
  end
end
