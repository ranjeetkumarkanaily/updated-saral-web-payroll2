require 'spec_helper'

describe FileUploader do
  before do
    @uploader = FileUploader.new
  end

  #after do
  #  FileUtils.rm_rf(public_path)
  #end

  describe '#store_dir' do
    it "should #{::Rails.root.to_s}/public/excel_uploaded_files/" do
      @uploader.store_dir.should == "#{::Rails.root.to_s}/public/excel_uploaded_files/"
    end
  end

  describe '#extension_white_list' do
    it "should [xls]" do
      @uploader.extension_white_list.should == ["xls", "db"]
    end
  end
end
