class Employee < ActiveRecord::Base

  has_many :employee_details, :dependent => :destroy

  validates :empname, :presence => true,
                    :length   => {:maximum => 100}

  validates :date_of_joining, :presence => true

  validate :doj_before_dol


  def doj_before_dol
    if !date_of_joining.nil? and !date_of_leaving.nil? and date_of_joining >= date_of_leaving then
      errors.add(:date_of_joining, "date of joining should be before date of leaving")
    end
  end

end
