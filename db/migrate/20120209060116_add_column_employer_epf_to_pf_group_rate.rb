class AddColumnEmployerEpfToPfGroupRate < ActiveRecord::Migration
  def change
    add_column :pf_group_rates, :employer_epf, :float
  end
end
