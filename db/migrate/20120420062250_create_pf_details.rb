class CreatePfDetails < ActiveRecord::Migration
  def change
    create_table :pf_details do |t|
      t.references :branch
      t.references :pf_group
      t.date :pf_effective_date

      t.timestamps
    end
    add_index :pf_details, :branch_id
    add_index :pf_details, :pf_group_id

    add_foreign_key :pf_details, :branches
    add_foreign_key :pf_details, :pf_groups
  end
end
