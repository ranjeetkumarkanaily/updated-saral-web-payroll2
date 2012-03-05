class AddColumnClassificationToEmployeeDetails < ActiveRecord::Migration
  def change
    add_column :employee_details, :classification, :hstore
  end
end
