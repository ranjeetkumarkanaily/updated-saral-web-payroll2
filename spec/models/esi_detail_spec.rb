require 'spec_helper'

describe EsiDetail do
  describe "Esi Details " do
    before :each do
      @date_format = FactoryGirl.create(:date_format)
      @option_setting = FactoryGirl.create(:option_setting)
      @esi_detail = FactoryGirl.create(:esi_detail)
    end
    it "return effective to " do
      esi_grp = FactoryGirl.create(:esi_group, :id => 2, :esi_no => "DL12345", :esi_group_name => "Delhi")
      esi_det = EsiDetail.create(:branch_id => @esi_detail.branch_id, :esi_group_id => esi_grp.id, :esi_effective_date => "2012-05-01")
      esi_det.effective_to.should eq('Till Date')
    end

    it "return effective to " do
      esi_grp = FactoryGirl.create(:esi_group, :id => 3, :esi_no => "DL12345", :esi_group_name => "Delhi")
      esi_grp1 = FactoryGirl.create(:esi_group, :id => 4, :esi_no => "DL12367", :esi_group_name => "Kolkatta")
      esi_det = EsiDetail.create(:branch_id => @esi_detail.branch_id, :esi_group_id => esi_grp.id, :esi_effective_date => "2012-05-01")
      esi_det1 = EsiDetail.create(:branch_id => @esi_detail.branch_id, :esi_group_id => esi_grp1.id, :esi_effective_date => "2012-05-21")
      esi_det.effective_to.should eq('2012-05-20')
    end
  end
end
