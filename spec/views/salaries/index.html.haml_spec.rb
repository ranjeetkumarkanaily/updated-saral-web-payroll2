require 'spec_helper'


describe "salaries/index.html.haml" do

  it "render form to generate salary" do
    render
    puts rendered
    assert_select "form", :action => "/salaries", :method => "post" do
      assert_select "select#month_year", :name => "month_year"
    end
  end

end