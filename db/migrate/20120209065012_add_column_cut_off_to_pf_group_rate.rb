class AddColumnCutOffToPfGroupRate < ActiveRecord::Migration
  def change
    add_column :pf_group_rates, :cutoff, :float
  end
end
