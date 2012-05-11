require 'spec_helper'

describe UploadFileType do
  it "should return array values" do
    file_type=FactoryGirl.create(:upload_file_type)
    values = UploadFileType.validate_file_type(file_type.file_type)
    values.should eq(["application/pdf", "application/msword"])
  end
end
