class AddRoundOffColumnToSalaryGroupDetail < ActiveRecord::Migration
  def change
    add_column :salary_group_details, :round_off, :string
  end
end
