class LeaveDetail < ActiveRecord::Base
  attr_accessible :employee_id, :leave_date
  acts_as_audited

  belongs_to :employee, :validate => true
  validates_presence_of :leave_date, :employee_id
  validates_presence_of :employee, :message => " does not exists."
  validates_uniqueness_of :employee_id, :scope => :leave_date, :message => " Leave has already taken"

  delegate :refno, :empname, :to => :employee, :prefix => true

  def self.process_leaves_excel_sheet leave_excel_sheet
    leaves_details = Hash.new
    leaves_details["leave_details"] = []
    leaves_details["errors"] = Hash.new
    errors = Hash.new
    counter = 0

    excel_first_row = leave_excel_sheet.first

    if duplicates_in_leave_columns? excel_first_row
      errors["#{counter+1}"] = ["Duplication of leave columns"]
    else
      leave_excel_sheet.each 1 do |row|
        counter+=1
        liv = LeaveDetail.new
        liv.employee_id = Employee.find_by_refno("#{row[0]}").id
        liv.leave_date = row[1]

        if liv.valid?
          leaves_details["leave_details"] << liv
        else
          errors["#{counter+1}"] = liv.errors
        end
      end
    end
    leaves_details["errors"] = errors
    leaves_details
  end

  def self.duplicates_in_leave_columns? leave_columns
    leave_columns.size != leave_columns.uniq.size ? true : false
  end
end
