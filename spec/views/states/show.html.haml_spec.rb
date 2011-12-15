require 'spec_helper'

describe "states/show.html.haml" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :state_name => "State Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State Name/)
  end
end
