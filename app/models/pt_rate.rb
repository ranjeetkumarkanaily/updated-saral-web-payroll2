class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth

  validates_presence_of :PtGroup_id, :paymonth_id
  validates :min_sal_range, :uniqueness => true

  before_validation :create_ranges_on_sal_ranges

  #after_create :update_previous_row_max_sal_range
 # after_update :update_previous_row_max_sal_range#, :update_self_max_sal_range

  #before_update :update_self_max_sal_range

  #before_destroy :update_rows


    def get_max_sal_range
      next_row = next_row_on_min_sal_range
      (next_row.min_sal_range.to_f - 0.01) if next_row
    end

    def create_ranges_on_sal_ranges
      PtRate.select("pt").where("  ")
    end


   private

    def next_row_on_min_sal_range
      PtRate.where("min_sal_range > ? and paymonth_id = ?", self.min_sal_range, self.paymonth_id).order("min_sal_range").first
    end

    #def prev_row_on_min_sal_range
    #  PtRate.where("min_sal_range < ? and paymonth_id = ?", self.min_sal_range, self.paymonth_id).order("min_sal_range DESC").first
    #end
    #
    #def update_previous_row_max_sal_range
    #  prev_row = prev_row_on_min_sal_range
    #  prev_row.update_attribute(:max_sal_range, (self.min_sal_range - 0.01)) if prev_row
    #end
    #
    #def update_self_max_sal_range
    #  next_row = next_row_on_min_sal_range
    #  self.max_sal_range = (next_row.min_sal_range - 0.01) if next_row
    #end
    #
    #def update_rows
    #  if self.id == PtRate.order("min_sal_range").first.id
    #    PtRate.order("min_sal_range").first.delete
    #  elsif self.id == PtRate.order("min_sal_range DESC").first.id
    #    puts "kanaily"
    #    puts self.id
    #    prev_row = prev_row_on_min_sal_range
    #    puts prev_row.inspect
    #    prev_row.update_attribute(:max_sal_range , 0)
    #  else
    #    prev_row_on_min_sal_range.update_attribute(:max_sal_range, (next_row_on_min_sal_range.min_sal_range - 0.01))
    #  end
    #end

end
