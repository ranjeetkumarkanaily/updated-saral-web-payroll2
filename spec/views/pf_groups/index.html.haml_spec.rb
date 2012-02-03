require 'spec_helper'

describe "pf_groups/index" do
  before(:each) do
    assign(:pf_groups, [
      stub_model(PfGroup,
        :pf_group => "Pf Group",
        :pf_number => "Pf Number",
        :db_file_code => "Db File Code",
        :extension => 1,
        :address => "Address"
      ),
      stub_model(PfGroup,
        :pf_group => "Pf Group",
        :pf_number => "Pf Number",
        :db_file_code => "Db File Code",
        :extension => 1,
        :address => "Address"
      )
    ]).stub!(:total_pages).and_return(0)
  end

  it "renders a list of pf_groups" do
    render
    rendered.should have_content('Pf Group')
  end
end
