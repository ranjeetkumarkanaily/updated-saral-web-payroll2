class CreateBranchEsiDetails < ActiveRecord::Migration
  def up
    create_table :branch_esi_details do |t|
      t.references :branch
      t.references :esi_group
      t.date :esi_effective_date

      t.timestamps
    end

    add_index :branch_esi_details, :branch_id
    add_index :branch_esi_details, :esi_group_id

    add_foreign_key :branch_esi_details, :branches
    add_foreign_key :branch_esi_details, :esi_groups
  end

  def down
    drop_table :branch_esi_details
  end
end
