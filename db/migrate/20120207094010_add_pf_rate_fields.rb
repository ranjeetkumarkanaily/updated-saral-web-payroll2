class AddPfRateFields < ActiveRecord::Migration
  def up
    add_column :pf_group_rates, :pension_fund, :float
    add_column :pf_group_rates, :epf, :float
    add_column :pf_group_rates, :account_number_02, :float
    add_column :pf_group_rates, :account_number_22, :float
    add_column :pf_group_rates, :round_off, :string
    add_column :pf_group_rates, :restrict_employer_share, :boolean
    add_column :pf_group_rates, :restrict_employee_share_to_employer_share, :boolean
  end

end
