require 'spec_helper'

describe "classification_headings/edit" do
  before(:each) do
    @classification_heading = assign(:classification_heading, stub_model(ClassificationHeading,
      :classification_heading_name => "MyString",
      :display_order => 1
    ))
  end

  it "renders the edit classification_heading form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classification_headings_path(@classification_heading), :method => "post" do
      assert_select "input#classification_heading_classification_heading_name", :name => "classification_heading[classification_heading_name]"
      assert_select "input#classification_heading_display_order", :name => "classification_heading[display_order]"
    end
  end
end
