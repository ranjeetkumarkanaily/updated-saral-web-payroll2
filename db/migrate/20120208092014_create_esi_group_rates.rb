class CreateEsiGroupRates < ActiveRecord::Migration
  def change
    create_table :esi_group_rates do |t|
      t.integer :esi_group_id
      t.float :employee_rate
      t.float :employer_rate
      t.float :cut_off
      t.float :minimum_limit_dailywage
      t.string :round_off

      t.timestamps
    end
    add_foreign_key :esi_group_rates, :esi_groups
  end
end
