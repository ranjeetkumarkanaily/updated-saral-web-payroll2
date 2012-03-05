class Employee < ActiveRecord::Base

  regex_for_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :employee_details, :dependent => :destroy
  has_many :salary_totals, :dependent => :destroy

  has_many :leave_details, :dependent => :destroy

  belongs_to :designation
  belongs_to :department
  belongs_to :grade

  belongs_to :present_state, :class_name => "State"

  validates :empname, :presence => true,
                    :length   => {:maximum => 100}
  validates :present_state_id, :presence => true

  validates :date_of_joining, :presence => true

  validates :refno,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }


  validates :email,   :presence   => true,
                    :format     => { :with => regex_for_email },
                    :uniqueness => { :case_sensitive => false }

  validate :doj_before_dol

  validate :dob_before_doj

  validates_presence_of :designation
  validates_presence_of :department
  validates_presence_of :grade

  has_many :salary_allotments

  belongs_to :branch
  belongs_to :financial_institution



  def dob_before_doj
    if !date_of_birth.nil? and !date_of_joining.nil? and date_of_birth >= date_of_joining then
      errors.add(:date_of_joining, "date of birth should be before date of joining")
    end
  end


  def doj_before_dol
    if !date_of_joining.nil? and !date_of_leaving.nil? and date_of_joining >= date_of_leaving then
      errors.add(:date_of_joining, "date of joining should be before date of leaving")
    end
  end

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['refno ILIKE ? OR empname ILIKE ? OR email ILIKE ?', search_condition, search_condition, search_condition])
  end

  def self.employee_with_salary_not_allotted
    Employee.joins(:salary_allotments).where("0 = (SELECT SUM(salary_allotment) from salary_allotments WHERE employee_id = employees.id)").group('employees.id')
  end

  def self.employee_with_salary_allotted
    Employee.joins(:salary_allotments).where("0 < (SELECT SUM(salary_allotment) from salary_allotments WHERE employee_id = employees.id)").group('employees.id')
  end

  def self.chk_dol emp_id
    date_of_leaving = Employee.find(emp_id).date_of_leaving
  end

end