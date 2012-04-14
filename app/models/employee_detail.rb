class EmployeeDetail < ActiveRecord::Base

  attr_accessible :employee_id, :effective_date, :salary_group_id, :allotted_gross,:classification,:branch_id,:financial_institution_id,:attendance_configuration_id,:bank_account_number,:effective_to
  acts_as_audited

  attr_accessor :current_employee_id

  serialize :classification,HstoreSerializer
  belongs_to :employee
  belongs_to :salary_group
  belongs_to :financial_institution
  has_many :salary_allotments, :dependent => :destroy
  has_many :salaries, :dependent => :destroy
  has_many :classification_headings

  validates_presence_of :employee_id
  validates_presence_of :salary_group_id
  validates_presence_of :effective_date

  validates_uniqueness_of :employee_id, :scope => [:effective_date],:message => "Details already exist for the same date"



  delegate :salary_group_name, :to => :salary_group, :prefix => true
  delegate :empname, :to => :employee, :prefix => true




  def self.set_current_employee_id employee_id
    @current_employee_id = employee_id
  end
  def self.effective_date_after_doj? effective_date
    result = true
    if effective_date < Employee.find(@current_employee_id).date_of_joining then
      error = "effective_date should be after date of joining"
      result = false
    end
    [result,error]
  end

  def self.effective_date_before_dol? effective_date
    result = true
    if Employee.find(@current_employee_id).date_of_leaving != nil then
      if effective_date > Employee.find(@current_employee_id).date_of_leaving then
        error = "effective_date should be before date of leaving"
        result = false
      end
    end
    [result,error]
  end

  def self.effective_date_validation? effective_date
    result = true
    last_record_id = last_record @current_employee_id
    if last_record_id != 0
      last_effective_date = EmployeeDetail.find(last_record_id).effective_date
      if effective_date < last_effective_date then
        error = "effective_date should be after date of last saved Effective date"
        result = false
      end
    end
    [result,error]
  end

  def self.update_last_record last_record_id,effective_date
    pre_employee_detail = EmployeeDetail.find(last_record_id)
    pre_employee_detail.update_attribute(:effective_to,effective_date)

  end

  def self.last_record employee_id
    last_record_id = 0
    if EmployeeDetail.count(:conditions => "employee_id = #{employee_id}") > 0 then
      last_record_id = EmployeeDetail.where(:employee_id => employee_id).order('created_at desc')
      last_record_id = last_record_id[0]['id']
    end
    last_record_id
  end

  def self.employee_branch month_date, emp_id
    emp_det_branch = EmployeeDetail.select('branch_id').where("effective_date = '#{month_date.beginning_of_month}' and employee_id = ?",emp_id)
    if emp_det_branch.count > 0
      emp_branch = emp_det_branch
    else
      emp_branch =  EmployeeDetail.select('branch_id').where("effective_date = (select MAX(effective_date) from employee_details where employee_id = #{emp_id}) and employee_id = ?",emp_id)
    end
    emp_branch
  end
end
