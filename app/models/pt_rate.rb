class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth

  validates_presence_of :PtGroup_id, :paymonth_id
  before_validation :populate_max_sal_range
  before_destroy :update_rows

  private

    def update_rows
      if self.id == PtRate.first.id
        PtRate.first.delete
      elsif self.id == PtRate.last.id
        previous_row.update_attribute(:max_sal_range , 0)
      else
        previous_row.update_attribute(:max_sal_range, (next_row.min_sal_range - 0.01))
      end
    end

    def populate_max_sal_range
      self.max_sal_range = 0
      row = PtRate.find(:last, :conditions => {:paymonth_id => self.paymonth_id})
      if row
        if self.min_sal_range > row.min_sal_range.to_f
          row.update_attribute(:max_sal_range , (self.min_sal_range - 0.01))
        else
          self.errors.add(:salary, " range is already exists.")
        end
      end
    end

    def previous_row
      PtRate.where("id < ? and paymonth_id = ?", self.id, self.paymonth_id).order("id DESC").first
    end

    def next_row
      PtRate.where("id > ? and paymonth_id = ?", self.id, self.paymonth_id).first
    end

end
