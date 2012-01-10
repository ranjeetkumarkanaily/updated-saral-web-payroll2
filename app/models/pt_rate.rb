class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth
  validates_presence_of :PtGroup_id, :paymonth_id
end
