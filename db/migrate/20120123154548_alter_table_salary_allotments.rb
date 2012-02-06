class AlterTableSalaryAllotments < ActiveRecord::Migration
  def change
    add_column :salary_allotments, :salary_group_detail_id, :integer
    add_foreign_key :salary_allotments, :salary_group_details
  end


end