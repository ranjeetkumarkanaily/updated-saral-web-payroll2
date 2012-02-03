require 'spec_helper'

describe "classifications/show" do
  before(:each) do
    @classification = assign(:classification, stub_model(Classification,
      :classification_heading_id => 1,
      :classification_name => "Classification Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Classification Name/)
  end
end
