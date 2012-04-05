class AddIndexForSalaryGroupDetialIdToSalary < ActiveRecord::Migration
  def change
    add_index :salaries, :salary_group_detail_id
  end
end
