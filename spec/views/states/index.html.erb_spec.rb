require 'spec_helper'

describe "states/index.html.erb" do
  before(:each) do
    assign(:states, [
      stub_model(State,
        :state_name => "State Name"
      ),
      stub_model(State,
        :state_name => "State Name"
      )
    ])
  end

  it "renders a list of states" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State Name".to_s, :count => 2
  end
end
