class CreateLeaveDetails < ActiveRecord::Migration
  def change
    create_table :leave_details do |t|
      t.references :employee
      t.date :leave_date

      t.timestamps
    end
     add_index :leave_details, :employee_id
  end
end
