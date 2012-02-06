class RemovePtGroupColumnFromPtRates < ActiveRecord::Migration
  def up
    remove_index :pt_rates, :PtGroup_id
    rename_column :pt_rates, :PtGroup_id, :pt_group_id

    add_foreign_key :pt_rates, :pt_groups
  end

end
