class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_name
      t.string :responsible_person
      t.string :address
      t.references :pf_group
      t.references :esi_group
      t.references :pt_group

      t.timestamps
    end
    add_index :branches, :pf_group_id
    add_index :branches, :esi_group_id
    add_index :branches, :pt_group_id
  end
end
