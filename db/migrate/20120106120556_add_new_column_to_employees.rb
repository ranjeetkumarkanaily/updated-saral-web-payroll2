class AddNewColumnToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :designation_id, :integer
    add_column :employees, :department_id, :integer
    add_column :employees, :grade_id, :integer
  end
end