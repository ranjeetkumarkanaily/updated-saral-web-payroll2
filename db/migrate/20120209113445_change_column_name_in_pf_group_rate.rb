class ChangeColumnNameInPfGroupRate < ActiveRecord::Migration
  def up
    rename_column :pf_group_rates,:restrict_employer_share_to_employer_share,:restrict_employee_share_to_employer_share
  end

  def down
  end
end
