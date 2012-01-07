require 'spec_helper'

describe "designations/show" do
  before(:each) do
    @designation = assign(:designation, stub_model(Designation,
      :designation => "Designation"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Designation/)
  end
end
