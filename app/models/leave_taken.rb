class LeaveTaken < ActiveRecord::Base
  attr_accessible :count, :employee_id, :from_date, :lop_count
  acts_as_audited

  belongs_to :employee, :validate => true
  validates_presence_of :from_date, :employee_id , :count
  validates_presence_of :employee, :message => " does not exists."

  #def set_to_date
  #  Date.strptime(from_date.to_s,"%Y-%m-%d")+count
  #end

  def self.process_leaves_excel_sheet leave_excel_sheet
    leaves_takens = Hash.new
    leaves_takens["leaves_takens"] = []
    leaves_takens["errors"] = Hash.new
    errors = Hash.new
    counter = 0

    excel_first_row = leave_excel_sheet.first

    if duplicates_in_leave_columns? excel_first_row
      errors["#{counter+1}"] = ["Duplication of leave columns"]
    else
      leave_excel_sheet.each 1 do |row|
        counter+=1
        liv = LeaveTaken.new
        liv.employee_id = Employee.find_by_refno("#{row[0]}").id
        liv.from_date = row[1]
        liv.count = row[2]
        liv.lop_count = row[3]
        leaves_takens["leaves_takens"] << liv

        #if liv.valid?
        #  leaves_takens["leaves_takens"] << liv
        #else
        #  errors["#{counter+1}"] = liv.errors
        #end
      end
    end
    leaves_takens["errors"] = errors
    leaves_takens
  end

  def self.duplicates_in_leave_columns? leave_columns
    leave_columns.size != leave_columns.uniq.size ? true : false
  end

end
