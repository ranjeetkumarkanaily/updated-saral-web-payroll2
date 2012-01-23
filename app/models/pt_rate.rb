class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth

  validates_presence_of :PtGroup_id, :paymonth_id
  validates :min_sal_range, :uniqueness => true

  def get_max_sal_range
    next_row = next_row_on_min_sal_range
    (next_row.min_sal_range.to_f - 0.01) if next_row
  end

  private

    def next_row_on_min_sal_range
      PtRate.where("min_sal_range > ? and paymonth_id = ?", self.min_sal_range, self.paymonth_id).order("min_sal_range").first
    end

end
