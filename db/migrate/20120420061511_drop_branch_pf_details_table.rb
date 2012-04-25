class DropBranchPfDetailsTable < ActiveRecord::Migration
  def up
    drop_table :branch_pf_details
    drop_table :branch_pt_details
    drop_table :branch_esi_details
  end

  def down
  end
end
