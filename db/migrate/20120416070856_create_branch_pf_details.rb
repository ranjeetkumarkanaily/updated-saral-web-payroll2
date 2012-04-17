class CreateBranchPfDetails < ActiveRecord::Migration
  def up
    create_table :branch_pf_details do |t|
      t.references :branch
      t.references :pf_group
      t.date :pf_effective_date

      t.timestamps
    end
    add_index :branch_pf_details, :branch_id
    add_index :branch_pf_details, :pf_group_id

    add_foreign_key :branch_pf_details, :branches
    add_foreign_key :branch_pf_details, :pf_groups
  end

  def down
    drop_table :branch_pf_details
  end
end
