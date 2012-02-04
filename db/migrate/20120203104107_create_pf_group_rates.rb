class CreatePfGroupRates < ActiveRecord::Migration
  def change
    create_table :pf_group_rates do |t|
      t.integer :pf_group_id
      t.integer :paymonth_id
      t.float :account_number_21
      t.timestamps
    end
    add_foreign_key :pf_group_rates, :pf_groups
    add_foreign_key :pf_group_rates, :paymonths
  end
end
