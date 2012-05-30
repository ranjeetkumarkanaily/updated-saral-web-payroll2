class AddFieldsToEmployeeStatutories < ActiveRecord::Migration
  def change
    add_column :employee_statutories, :based_on,:string
  end
end
