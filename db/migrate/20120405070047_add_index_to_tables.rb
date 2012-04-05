class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :employee_details, :employee_id
    add_index :employee_details, :salary_group_id
    add_index :employee_details, :branch_id
    add_index :employee_details, :financial_institution_id
    add_index :employee_details, :attendance_configuration_id
    add_index :employees, :present_state_id
    add_index :esi_group_rates, :esi_group_id
    add_index :holidays, :attendance_configuration_id
    add_index :pf_group_rates, :pf_group_id
    add_index :pf_group_rates, :paymonth_id
    add_index :pt_rates, :pt_group_id
    add_index :salary_allotments, :employee_id
    add_index :salary_allotments, :employee_detail_id
    add_index :salary_allotments, :salary_head_id
    add_index :salary_allotments, :salary_group_detail_id
  end
end
