class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth

  validates_presence_of :PtGroup_id, :paymonth_id
  before_validation :populate_max_sal_range
  after_validation :check_previous_range
  before_destroy :update_rows

  after_create :update_previous_row
  after_update :update_previous_row


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

    def check_previous_range
      if self.id
        row = previous_row
      else
        row = PtRate.find(:last, :conditions => {:paymonth_id => self.paymonth_id})
      end

      if row
        if self.min_sal_range < row.min_sal_range.to_f
          self.errors.add(:salary, " range is already exists.")
        else
          if next_row
            self.max_sal_range = next_row.min_sal_range - 0.01
          end

        end
      end
    end

    def update_previous_row
      if previous_row
        if self.min_sal_range > previous_row.min_sal_range.to_f
          previous_row.update_attribute(:max_sal_range , (self.min_sal_range - 0.01))
        else
          self.errors.add(:salary, " range is already exists.")
        end
      end
    end

    def update_self_max_range
      if next_row
        self.max_sal_range = next_row.min_sal_range - 0.01
      end
    end

    def populate_max_sal_range
      self.max_sal_range = 0
    end

    def previous_row
      PtRate.where("created_at < ? and paymonth_id = ?", self.created_at, self.paymonth_id).order("created_at DESC").first
    end

    def next_row
      PtRate.where("created_at > ? and paymonth_id = ?", self.created_at, self.paymonth_id).order("created_at").first
    end

end
