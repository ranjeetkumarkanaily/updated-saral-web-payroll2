class AddColumnInSalaries < ActiveRecord::Migration
  def change
    add_column :salaries, :salary_group_detail_id, :integer
    add_foreign_key :salaries, :salary_group_details
  end
end
