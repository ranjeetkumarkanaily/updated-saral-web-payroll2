class CreatePtGroupRates < ActiveRecord::Migration
  def change
    create_table :pt_group_rates do |t|
      t.references :pt_group
      t.references :paymonth

      t.timestamps
    end
    add_index :pt_group_rates, :pt_group_id
    add_index :pt_group_rates, :paymonth_id

    add_foreign_key :pt_group_rates, :pt_groups
    add_foreign_key :pt_group_rates, :paymonths
  end
end
