require 'spec_helper'

describe PtDetail do
  describe "Pt Details " do
    before :each do
      @date_format = FactoryGirl.create(:date_format)
      @option_setting = FactoryGirl.create(:option_setting)
      @pt_detail = FactoryGirl.create(:pt_detail)
    end
    it "return effective to " do
      pt_grp = FactoryGirl.create(:pt_group, :name => "Karnataka")
      pt_det = PtDetail.create(:branch_id => @pt_detail.branch_id, :pt_group_id => pt_grp.id, :pt_effective_date => "2012-05-01")
      pt_det.effective_to.should eq('Till Date')
    end

    it "return effective date " do
      pt_grp = FactoryGirl.create(:pt_group, :name => "Karnataka")
      pt_det = PtDetail.create(:branch_id => @pt_detail.branch_id, :pt_group_id => pt_grp.id, :pt_effective_date => "2012-05-01")
      pt_det1 = PtDetail.create(:branch_id => @pt_detail.branch_id, :pt_group_id => pt_grp.id, :pt_effective_date => "2012-05-21")
      pt_det.effective_to.should eq('2012-05-20')
    end
  end
end
