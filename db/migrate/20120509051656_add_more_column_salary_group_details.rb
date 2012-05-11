class AddMoreColumnSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :pt_applicability, :boolean
    add_column :salary_group_details, :pt_percentage, :decimal
  end
end
