class AddColumnSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :esi_applicability, :boolean
    add_column :salary_group_details, :esi_percentage, :decimal
  end
end
