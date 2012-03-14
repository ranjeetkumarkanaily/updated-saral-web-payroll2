require 'spec_helper'

describe "leave_details/upload" do
  it "render excel file upload" do
    render

    assert_select "form", :method => "post", :enctype=>"multipart/form-data" do
      assert_select "input#excel_file", :name => "excel_file"
    end

  end
end