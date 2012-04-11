class AddColumnClassificationToEmployeeDetails < ActiveRecord::Migration
  def change
    execute "CREATE EXTENSION hstore"
    add_column :employee_details, :classification, :hstore
  end
end
