require 'spec_helper'

describe EsiDetail do
  describe "Esi Details " do
    before :each do
      @esi_detail = FactoryGirl.create(:esi_detail)
    end
    it "return effective to " do
      esi_grp = FactoryGirl.create(:esi_group, :id => 2, :esi_no => "DL12345", :esi_group_name => "Delhi")
      esi_det = EsiDetail.create(:branch_id => @esi_detail.branch_id, :esi_group_id => esi_grp.id, :esi_effective_date => "2012-05-01")
      esi_det.effective_to.should eq('Till Date')

    end
  end
end
