class AddColumnsToEmployeeDetails < ActiveRecord::Migration
  def change
      add_column :employee_details, :branch_id, :integer
      add_column :employee_details, :financial_institution_id, :integer
      add_column :employee_details, :attendance_configuration_id, :integer
      add_column :employee_details, :bank_account_number, :string
      add_column :employee_details, :effective_to, :date
      add_foreign_key :employee_details, :branches
      add_foreign_key :employee_details, :financial_institutions
      add_foreign_key :employee_details, :attendance_configurations
  end
end
