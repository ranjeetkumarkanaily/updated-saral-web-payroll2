class CreatePtDetails < ActiveRecord::Migration
  def change
    create_table :pt_details do |t|
      t.references :branch
      t.references :pt_group
      t.date :pt_effective_date

      t.timestamps
    end
    add_index :pt_details, :branch_id
    add_index :pt_details, :pt_group_id

    add_foreign_key :pt_details, :branches
    add_foreign_key :pt_details, :pt_groups
  end
end
