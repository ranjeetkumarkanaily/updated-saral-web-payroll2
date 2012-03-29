class Holiday < ActiveRecord::Base
  acts_as_audited

  belongs_to :attendance_configuration

  def self.search(search)
    find(:all, :conditions => ['attendance_configuration_id = 1 OR attendance_configuration_id = ?', search])
  end

  def self.existing_holiday holiday
    holiday_date = holiday[:holiday_date]
    attendance = holiday[:attendance_configuration_id]
    find(:all, :conditions => ["attendance_configuration_id = ? AND holiday_date = ?", attendance,holiday_date])
  end
end
