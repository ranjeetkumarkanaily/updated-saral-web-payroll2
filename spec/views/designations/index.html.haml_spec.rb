require 'spec_helper'

describe "designations/index" do
  before(:each) do
    assign(:designations, [
      stub_model(Designation,
        :designation => "Designation"
      ),
      stub_model(Designation,
        :designation => "Designation"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of designations" do
    render
    rendered.should have_content('Designation')
  end
end
