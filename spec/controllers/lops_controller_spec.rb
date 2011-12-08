require 'spec_helper'

describe LopsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  it "should redirects new lop path" do
    my_file = fixture_file_upload("spec/factories/Upload.csv")
    class << my_file
      attr_reader :tempfile
    end
    post :file_upload, :my_file => my_file
    response.should be_success
  end

  #describe "Create" do
  #
  #  it "should redirects new salary path" do
  #    lines = Factory.build(:lop)
  #    post :create, :lines => [lines.attributes]
  #    response.should redirect_to(new_salary_path)
  #  end
  #
  #  it "should delete all record having same employee_id and month_year" do
  #    lines = Factory.create(:lop)
  #    expect {
  #      post :create, :lines => [lines.attributes]
  #    }.to change(Lop, :count).by(0)
  #  end
  #end

end