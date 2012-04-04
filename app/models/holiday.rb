class Holiday < ActiveRecord::Base
  attr_accessible :attendance_configuration_id, :holiday_date, :description, :national_holiday, :created_at,:updated_at
  acts_as_audited

  belongs_to :attendance_configuration
  delegate :attendance, :to => :attendance_configuration, :prefix => true

  def self.search(search)
    find(:all, :conditions => ['attendance_configuration_id = 1 OR attendance_configuration_id = ?', search])
  end

  def self.existing_holiday holiday
    holiday_date = holiday[:holiday_date]
    attendance = holiday[:attendance_configuration_id]
    find(:all, :conditions => ["attendance_configuration_id = ? AND holiday_date = ?", attendance,holiday_date])
  end
end
