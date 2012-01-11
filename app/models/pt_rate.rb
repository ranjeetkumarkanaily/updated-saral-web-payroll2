class PtRate < ActiveRecord::Base
  belongs_to :PtGroup
  belongs_to :paymonth

  validates_presence_of :PtGroup_id, :paymonth_id
  before_validation :check_max_min , :check_ranges

  private

    def check_max_min
      self.errors.add(:min_sal_range, "Minimum should be lesser than Maximum!") unless self.max_sal_range > self.min_sal_range
    end

    def check_ranges
      row = PtRate.find(:last, :conditions => ["id != #{self.id.nil? ? 0 : self.id}  and (paymonth_id = #{paymonth_id})"])
      if row
        self.errors.add(:salary, "Out of range") unless self.min_sal_range > row.max_sal_range
      end
    end

end
