require 'spec_helper'

describe PtDetail do
  describe "Pt Details " do
    before :each do
      @pt_detail = FactoryGirl.create(:pt_detail)
    end
    it "return effective to " do
      pt_grp = FactoryGirl.create(:pt_group, :name => "Karnataka")
      pt_det = PtDetail.create(:branch_id => @pt_detail.branch_id, :pt_group_id => pt_grp.id, :pt_effective_date => "2012-05-01")
      pt_det.effective_to.should eq('Till Date')
    end
  end
end
