class AddColumnToEsiGroupRate < ActiveRecord::Migration
  def change
    add_column :esi_group_rates, :paymonth_id, :integer
    add_index :esi_group_rates, :paymonth_id
    add_foreign_key :esi_group_rates, :paymonths
  end
end
