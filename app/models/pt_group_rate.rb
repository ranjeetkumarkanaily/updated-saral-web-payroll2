class PtGroupRate < ActiveRecord::Base
  attr_accessible :pt_group_id, :paymonth_id
  acts_as_audited

  belongs_to :pt_group
  belongs_to :paymonth

  delegate :month_name, :to => :paymonth, :prefix => true

  validates_uniqueness_of :pt_group_id, :scope => :paymonth_id

  def to_date
    next_row = next_row_on_pf_group_id
    (Date.strptime(Paymonth.find(next_row.paymonth_id).month_name, "%b/%Y")-1).strftime(OptionSetting.date_format_value) if next_row
  end

  def next_row_on_pf_group_id
    PtGroupRate.where("pt_group_id = ? AND paymonth_id > ?", self.pt_group_id, self.paymonth_id).order("paymonth_id").first
  end

  def create_pt_slabs
    new_pt_slab = []
    state_id = PtGroup.find(pt_group_id).state_id
    pt_slabs = PtSlab.find_all_by_state_id(state_id)
    pt_slabs.each do |ptslab|
      new_pt_slab = {:pt_group_id =>pt_group_id ,:paymonth_id=>paymonth_id,:min_sal_range=>ptslab.minimum_sal_range,:pt=>ptslab.pt}
      PtRate.create(new_pt_slab)
    end
  end
end
