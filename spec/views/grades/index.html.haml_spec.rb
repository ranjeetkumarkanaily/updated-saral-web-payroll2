require 'spec_helper'

describe "grades/index" do
  before(:each) do
    assign(:grades, [
      stub_model(Grade,
        :grade => "Grade"
      ),
      stub_model(Grade,
        :grade => "Grade"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of grades" do
    render
    rendered.should have_content('Grade')
  end
end
