class AddColumnToSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :pf_applicability, :boolean
    add_column :salary_group_details, :pf_percentage, :decimal
  end
end