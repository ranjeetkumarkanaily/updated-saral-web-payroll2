require 'spec_helper'

describe "states/index.html.haml" do
  before(:each) do
    assign(:states, [
      stub_model(State,
        :state_name => "State Name"
      ),
      stub_model(State,
        :state_name => "State Name"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of states" do
    render
    rendered.should have_content('State Name')
  end
end
