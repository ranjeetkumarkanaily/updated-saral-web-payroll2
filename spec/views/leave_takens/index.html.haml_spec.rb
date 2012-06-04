require 'spec_helper'

describe "leave_takens/index" do
  before(:each) do
    assign(:leave_takens, [
      stub_model(LeaveTaken,
        :employee_id => 1,
        :from_date => '2012-01-01',
        :count => "9.99"
      ),
      stub_model(LeaveTaken,
        :employee_id => 1,
        :from_date => '2012-01-01',
        :count => "9.99"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of leave_takens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should have_content('9.99')
  end
end
