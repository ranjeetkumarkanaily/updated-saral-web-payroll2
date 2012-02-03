require 'spec_helper'

describe "classification_headings/new" do
  before(:each) do
    assign(:classification_heading, stub_model(ClassificationHeading,
      :classification_heading_name => "MyString",
      :display_order => 1
    ).as_new_record)
  end

  it "renders new classification_heading form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => classification_headings_path, :method => "post" do
      assert_select "input#classification_heading_classification_heading_name", :name => "classification_heading[classification_heading_name]"
      assert_select "input#classification_heading_display_order", :name => "classification_heading[display_order]"
    end
  end
end
