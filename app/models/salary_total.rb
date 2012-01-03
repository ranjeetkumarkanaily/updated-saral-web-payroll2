class SalaryTotal < ActiveRecord::Base

  belongs_to :employee
  belongs_to :month_year

  # List of methods for each column in the salary totals.

  #def total_alloted_gross employee_id, month_year_id
  #
  #end
  #
  #def total_earned employee_id, month_year_id
  #
  #end
  #
  #def total_deducted employee_id, month_year_id
  #
  #end
  #
  #def net_salary employee_id, month_year_id
  #
  #end

end
