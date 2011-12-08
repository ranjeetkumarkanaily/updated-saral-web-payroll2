require 'spec_helper'

describe "employees/show.html.erb" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :empname => "Empname"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Empname/)
  end
end
