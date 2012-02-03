require 'spec_helper'

describe "classification_headings/show" do
  before(:each) do
    @classification_heading = assign(:classification_heading, stub_model(ClassificationHeading,
      :classification_heading_name => "Classification Heading Name",
      :display_order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Classification Heading Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
