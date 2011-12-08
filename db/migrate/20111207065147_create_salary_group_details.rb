class CreateSalaryGroupDetails < ActiveRecord::Migration
  def change
    create_table :salary_group_details do |t|
      t.string :calc_type
      t.string :calculation
      t.string :based_on
      t.references :salary_group
      t.references :salary_head

      t.timestamps
    end
    add_index :salary_group_details, :salary_group_id
    add_index :salary_group_details, :salary_head_id
  end
end
