class CreateBranchPtDetails < ActiveRecord::Migration
  def up
    create_table :branch_pt_details do |t|
      t.references :branch
      t.references :pt_group
      t.date :pt_effective_date

      t.timestamps
    end

    add_index :branch_pt_details, :branch_id
    add_index :branch_pt_details, :pt_group_id

    add_foreign_key :branch_pt_details, :branches
    add_foreign_key :branch_pt_details, :pt_groups
  end

  def down
    drop_table :branch_pt_details
  end
end
