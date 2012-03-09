require 'spec_helper'


describe "lops/index" do
  it "render form for csv file upload" do
    render
    #puts rendered
    assert_select "form", :action => "/lops/file_upload", :method => "post", :enctype=>"multipart/form-data" do
      assert_select "input#my_file", :name => "my_file"
    end
  end
end