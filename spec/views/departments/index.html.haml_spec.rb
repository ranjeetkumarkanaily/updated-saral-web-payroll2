require 'spec_helper'

describe "departments/index" do
  before(:each) do
    assign(:departments, [
      stub_model(Department,
        :department => "Department"
      ),
      stub_model(Department,
        :department => "Department"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of departments" do
    render
    rendered.should have_content('Department')
  end
end
