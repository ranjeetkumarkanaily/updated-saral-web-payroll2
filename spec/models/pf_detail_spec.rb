require 'spec_helper'

describe PfDetail do
  describe "Pf Details " do
    before :each do
      @pf_detail = FactoryGirl.create(:pf_detail)
    end
    it "return effective to " do
      pf_grp = FactoryGirl.create(:pf_group, :id => 2, :pf_number => "DL12345", :pf_group => "Delhi")
      pf_det = PfDetail.create(:branch_id => @pf_detail.branch_id, :pf_group_id => pf_grp.id, :pf_effective_date => "2012-05-01")
      pf_det.effective_to.should eq('Till Date')
    end
  end
end
