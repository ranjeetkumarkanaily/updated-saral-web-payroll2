require 'spec_helper'

describe State do
  before(:each) do
  @attr = {
    :state_name => "Karnataka"
  }
  end

  it "should require a name" do
    no_name_state = State.new(@attr.merge(:state_name => ""))
    no_name_state.should_not be_valid
  end

  it "rejects duplicate state names" do
    State.create!(@attr)
    state_with_duplicate_name = State.new(@attr)
    state_with_duplicate_name.should_not be_valid
  end

  it "rejects state names up to case" do
    upcased_state = @attr[:state_name].upcase
    State.create!(@attr.merge(:state_name => upcased_state))
    state_with_duplicate_name = State.new(@attr)
    state_with_duplicate_name.should_not be_valid
  end
end
