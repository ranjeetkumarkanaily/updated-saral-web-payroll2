require 'spec_helper'

describe "esi_groups/show" do
  before(:each) do
    @esi_group = assign(:esi_group, stub_model(EsiGroup,
      :esi_group_name => "Esi Group Name",
      :address => "Address",
      :esi_no => "Esi No",
      :esi_local_office => "Esi Local Office"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Esi Group Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Esi No/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Esi Local Office/)
  end
end
