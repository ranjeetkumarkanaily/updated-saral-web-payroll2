require 'spec_helper'

describe "employees/index.html.erb" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :empname => "Empname"
      ),
      stub_model(Employee,
        :empname => "Empname"
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Empname".to_s, :count => 2
  end
end
