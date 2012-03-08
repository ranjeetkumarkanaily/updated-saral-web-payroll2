class SalaryAllotment < ActiveRecord::Base
  belongs_to :salary_head
  belongs_to :employee
  belongs_to :employee_detail
  belongs_to :salary_group_detail

  def salaryHead
    SalaryHead.find(salary_head_id).head_name
  end

  def shortName
    SalaryHead.find(salary_head_id).short_name
  end

  def salaryHeadType
    SalaryHead.find(salary_head_id).salary_type
  end

  def generation_formula
    basic_formula = self.salary_group_detail.calculation
    basic_formula.gsub!(/\(/,'( ')
    basic_formula.gsub!(/\)/,' )')
    arrFormula = basic_formula.split(" ")
    new_arr = arrFormula.grep /[A-Za-z]{2,6}/
    new_arr.each do |node|
      salHead = SalaryHead.find_by_short_name(node)
      if salHead
        salGrpdet = SalaryGroupDetail.find_by_salary_head_id_and_salary_group_id(salHead.id,self.employee_detail.salary_group_id)
        if salGrpdet.calc_type == 'Formula'
          basic_formula["#{node}"] = "(#{salGrpdet.calculation})"
        else
          basic_formula["#{node}"] = "0"
        end
      end
    end
    basic_formula
  end

  def self.get_allotted_salaries month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    SalaryAllotment.where("extract(month from effective_date) = #{month_year.month} and extract(year from effective_date) = #{month_year.year} AND employee_id = #{employee_id}").order("salary_head_id ASC")
  end

  def self.get_allotted_salaries_for_max_effective_date month_year, employee_id
    month_year = Date.strptime month_year, '%b/%Y'
    SalaryAllotment.select("id, employee_id, employee_detail_id,date_trunc('month', date('#{month_year.year}-#{month_year.month}-01') + '1 month'::interval) - '1 day'::interval as effective_date, salary_head_id, salary_allotment").where("employee_id = #{employee_id} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{employee_id})").order("salary_head_id ASC")
  end

  def self.row_for_salary_allotment employee_id
    SalaryAllotment.where("employee_id = #{employee_id} and effective_date = (select MAX(effective_date) from salary_allotments where employee_id = #{employee_id})").order('salary_head_id ASC')
  end

end