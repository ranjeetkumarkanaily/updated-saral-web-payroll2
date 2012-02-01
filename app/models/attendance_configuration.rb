class AttendanceConfiguration < ActiveRecord::Base
  validates :attendance,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :short_name,   :presence   => true,
            :uniqueness => { :case_sensitive => false },
            :length => {:minimum => 1, :maximum => 10}

  validates :salary_calendar_days,   :presence   => true
end
