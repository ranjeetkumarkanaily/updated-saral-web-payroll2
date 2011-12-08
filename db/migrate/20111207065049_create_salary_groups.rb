class CreateSalaryGroups < ActiveRecord::Migration
  def change
    create_table :salary_groups do |t|
      t.string :salary_group_name
      t.boolean :based_on_gross

      t.timestamps
    end
  end
end
