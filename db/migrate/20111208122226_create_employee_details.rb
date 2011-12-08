class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.integer :employee_id
      t.date :effective_date
      t.integer :salary_group_id
      t.decimal :allotted_gross, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
