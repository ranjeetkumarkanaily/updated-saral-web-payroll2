require 'spec_helper'

describe "esi_groups/index" do
  before(:each) do
    assign(:esi_groups, [
        stub_model(EsiGroup,
                   :esi_group_name => "Esi Group Name",
                   :address => "Address",
                   :esi_no => "Esi No",
                   :esi_local_office => "Esi Local Office"
        ),
        stub_model(EsiGroup,
                   :esi_group_name => "Esi Group Name",
                   :address => "Address",
                   :esi_no => "Esi No",
                   :esi_local_office => "Esi Local Office"
        )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of esi_groups" do
    render
    rendered.should have_content('Esi Local Office')
  end
end
