require 'spec_helper'

describe "designations/new" do
  before(:each) do
    assign(:designation, stub_model(Designation,
      :designation => "MyString"
    ).as_new_record)
  end

  it "renders new designation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => designations_path, :method => "post" do
      assert_select "input#designation_designation", :name => "designation[designation]"
    end
  end
end
