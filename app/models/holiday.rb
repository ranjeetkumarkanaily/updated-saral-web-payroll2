class Holiday < ActiveRecord::Base

  belongs_to :attendance_configuration

  validates_uniqueness_of :holiday_date

  def self.search(search)
    find(:all, :conditions => ['attendance_configuration_id = 1 OR attendance_configuration_id = ?', search])
  end
end
