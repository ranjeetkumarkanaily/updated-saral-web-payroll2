class AddNewColumnToSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :print_name, :string
    add_column :salary_group_details, :print_order, :integer
  end
end
