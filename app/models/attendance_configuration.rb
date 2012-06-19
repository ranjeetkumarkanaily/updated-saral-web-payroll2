class AttendanceConfiguration < ActiveRecord::Base
  attr_accessible :attendance, :short_name, :salary_calendar_days
  acts_as_audited

  validates :attendance,   :presence   => true,
            :uniqueness => { :case_sensitive => false }

  validates :short_name,   :presence   => true,
            :uniqueness => { :case_sensitive => false },
            :length => {:minimum => 1, :maximum => 10}

  validates :salary_calendar_days,   :presence   => true

  has_many :holidays, :dependent => :destroy

  has_many :employee_details, :dependent => :restrict

  scope :attendances, :order => 'created_at ASC'
end
