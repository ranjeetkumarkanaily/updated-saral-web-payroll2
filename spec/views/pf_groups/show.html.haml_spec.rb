require 'spec_helper'

describe "pf_groups/show" do
  before(:each) do
    @pf_group = assign(:pf_group, stub_model(PfGroup,
      :pf_group => "Pf Group",
      :pf_number => "Pf Number",
      :db_file_code => "Db File Code",
      :extension => 1,
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pf Group/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pf Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Db File Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
  end
end
