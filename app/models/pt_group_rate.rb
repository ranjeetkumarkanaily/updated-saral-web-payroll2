class PtGroupRate < ActiveRecord::Base
  belongs_to :pt_group
  belongs_to :paymonth

  validates_uniqueness_of :pt_group_id, :scope => :paymonth_id
end
