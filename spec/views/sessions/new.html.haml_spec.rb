require 'spec_helper'

describe "sessions/new.html.haml" do
  before(:each) do
    assign(:user, stub_model(User,
      :username => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders User Login Page" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#username", :name => "username"
      assert_select "input#password", :name => "password"
    end
  end

end