class PtRate < ActiveRecord::Base
  acts_as_audited

  belongs_to :pt_group
  belongs_to :paymonth

  validates_presence_of :pt_group_id, :paymonth_id
  validates_uniqueness_of :min_sal_range, :scope => [:paymonth_id, :pt_group_id]

  def get_max_sal_range
    next_row = next_row_on_min_sal_range
    (next_row.min_sal_range.to_f - 0.01) if next_row
  end

  private

    def next_row_on_min_sal_range
      PtRate.where("min_sal_range > ? and paymonth_id = ? and pt_group_id = ?", self.min_sal_range, self.paymonth_id, self.pt_group_id).order("min_sal_range").first
    end

end
