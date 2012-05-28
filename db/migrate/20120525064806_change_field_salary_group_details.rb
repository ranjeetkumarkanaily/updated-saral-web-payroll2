class ChangeFieldSalaryGroupDetails < ActiveRecord::Migration
  def change
    remove_index :salary_group_details, :column => :paymonth_id
    remove_foreign_key :salary_group_details, :paymonths
    remove_column :salary_group_details, :paymonth_id



    add_column :salary_group_details, :effective_month, :string
  end
end
