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
  validate :effective_date_after_doj
  validate :effective_date_before_dol
  validate :effective_date_validation

  delegate :salary_group_name, :to => :salary_group, :prefix => true
  delegate :empname, :to => :employee, :prefix => true


  def effective_date_after_doj
     if effective_date < Employee.find(employee_id).date_of_joining then
      errors.add(:effective_date, "should be after date of joining")
    end
  end

  def effective_date_before_dol
    if Employee.find(employee_id).date_of_leaving != nil then
      if effective_date > Employee.find(employee_id).date_of_leaving then
        errors.add(:effective_date, "should be before date of leaving")
      end
    end
  end

  def effective_date_validation
    last_record_id = last_record employee_id
    if last_record_id != 0
      last_effective_date = EmployeeDetail.find(last_record_id).effective_date
      if effective_date < last_effective_date then
        errors.add(:effective_date, "should be after date of last saved Effective date")
      end
    end
  end

  def update_last_record(employee_id=employee_id)
    last_record_id = last_record employee_id
    if last_record_id > 0
      pre_employee_detail = EmployeeDetail.find(last_record_id)
      pre_employee_detail.update_attribute(:effective_to,self.effective_date)
    end
  end

  def last_record(employee_id)
    last_record_id = 0
    if EmployeeDetail.count(:conditions => "employee_id = #{employee_id}") > 0 then
      last_record_id = EmployeeDetail.where(:employee_id => employee_id).order('created_at desc')
      last_record_id = last_record_id[0]['id']
    end
    last_record_id
  end

  def employee_salary_allotment
    sal_gr_id = salary_group_id
    SalaryGroupDetail.salary_group_details(sal_gr_id).each do |sgd|
      SalaryAllotment.create!(:employee_id => employee_id, :employee_detail_id => id, :effective_date => effective_date, :salary_head_id => sgd.salary_head_id, :salary_group_detail_id => sgd.id, :salary_allotment =>0)
    end
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
