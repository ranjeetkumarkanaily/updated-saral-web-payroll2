require 'spec_helper'

describe "leave_takens/index" do
  before(:each) do
    FactoryGirl.create(:date_format)
    FactoryGirl.create(:option_setting)
    employee = FactoryGirl.create(:employee)
    assign(:leave_takens, [
      stub_model(LeaveTaken,
        :employee_id => employee.id,
        :leave_detail_date => '2012-01-01',
        :leave_count => "9.99"
      ),
      stub_model(LeaveTaken,
        :employee_id => employee.id,
        :leave_detail_date => '2012-01-01',
        :leave_count => "9.99"
      )
    ]).stub!(:total_pages).and_return(0)

  end

  it "renders a list of leave_takens" do
    render
    rendered.should have_content('9.99')
  end
end
