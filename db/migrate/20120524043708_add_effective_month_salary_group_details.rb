class AddEffectiveMonthSalaryGroupDetails < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :paymonth_id, :integer
    add_index :salary_group_details, :paymonth_id
    add_foreign_key :salary_group_details, :paymonths

  end
end

