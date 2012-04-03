class AddPanDetailsFieldsToEmployeeDetails < ActiveRecord::Migration
  def change
    add_column :employee_details, :pan, :string
    add_column :employee_details, :pan_effective_date, :date
  end
end
