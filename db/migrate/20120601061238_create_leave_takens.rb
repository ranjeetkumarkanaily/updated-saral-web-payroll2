class CreateLeaveTakens < ActiveRecord::Migration
  def change
    create_table :leave_takens do |t|
      t.integer :employee_id
      t.date :from_date
      t.decimal :count, :precision => 8, :scale => 2
      t.timestamps
    end
    add_index  :leave_takens, :employee_id
    add_foreign_key :leave_takens, :employees
  end
end
