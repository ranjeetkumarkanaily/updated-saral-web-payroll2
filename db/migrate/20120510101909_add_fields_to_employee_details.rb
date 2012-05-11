class AddFieldsToEmployeeDetails < ActiveRecord::Migration
  def change
    add_column :employee_details, :international_worker, :boolean
  end
end
