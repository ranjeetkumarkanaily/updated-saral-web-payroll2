class Employee < ActiveRecord::Base
  attr_accessible :empname, :date_of_joining, :date_of_leaving, :date_of_birth, :marital_status, :father_name, :spouse_name , :gender, :present_res_no, :present_res_name, :present_street, :present_locality, :present_city, :present_state_id, :perm_res_no, :perm_res_name, :perm_street, :perm_locality, :perm_city, :perm_state_id, :perm_sameas_present , :email, :mobile, :refno, :restrct_pf
  acts_as_audited

  regex_for_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :employee_details, :dependent => :destroy

  has_many :leave_details, :dependent => :destroy

  has_many :salary_allotments
  has_one :employee_statutory

  belongs_to :present_state, :class_name => "State"
  delegate :state_name, :to => :present_state, :prefix => true

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

  scope:employees_list, lambda {|month_year|
    where("date_of_leaving IS NULL OR (EXTRACT(MONTH FROM date_of_leaving)=#{month_year.month} AND EXTRACT(YEAR FROM date_of_leaving)=#{month_year.year})").order("created_at ASC")
  }

  def self.report_data report_type,classification
    condition=''
    if classification != nil
      classification = classification.to_hash
      classification.each_pair { |key,value| (condition.length > 1)? condition = condition + " and  classification -> '#{key}' ILIKE '#{value}' " :condition = condition + " classification -> '#{key}' ILIKE '#{value}' " if value != '' }
    end
    (condition.length > 1)? condition = condition + " and #{report_type} IS NOT NULL" : condition = "#{report_type} IS NOT NULL" if report_type != "Contact"
    @employees = Employee.includes(:employee_details).joins(:employee_details).where("#{condition}").order('employees.created_at ASC')

    @employees
  end

  def self.process_employee_excel_sheet employee_excel_sheet
    employees = Hash.new
    employees["employees_save"] = []
    employees["employees_update"] = []
    employees["errors"] = Hash.new
    errors = Hash.new
    counter = 0

    excel_first_row = employee_excel_sheet.first

    if duplicates_in_employee_columns? excel_first_row
      errors["#{counter+1}"] = ["Duplication of Employee Columns"]
    else
      employee_excel_sheet.each 1 do |row|
        counter+=1

        e = Employee.new
        e.refno = row[0].to_s
        e.empname = row[1]
        e.father_name = row[2]
        e.marital_status = row[3]
        e.spouse_name = row[4]
        e.gender = row[5]
        e.date_of_birth = row[6]
        e.date_of_joining = row[7]
        e.date_of_leaving = row[8]
        e.present_res_no = row[9]
        e.present_res_name = row[10]
        e.present_street = row[11]
        e.present_locality = row[12]
        e.present_city = row[13]
        e.present_state = State.find_by_state_name(row[14])
        e.email = row[15]
        e.mobile = row[16].to_s
        e.pan = row[17]

        if(Employee.exists?(:refno => e.refno))
          employees["employees_update"] << e
        else
          if e.valid?
            employees["employees_save"] << e
          else
            errors["#{counter+1}"] = e.errors
          end
        end
      end
    end
    employees["errors"] = errors
    employees
  end

  def self.duplicates_in_employee_columns? employee_columns
    employee_columns.size != employee_columns.uniq.size ? true : false
  end

end