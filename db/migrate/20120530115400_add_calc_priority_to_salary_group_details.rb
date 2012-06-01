class AddCalcPriorityToSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :calc_priority_no,:integer
  end
end
