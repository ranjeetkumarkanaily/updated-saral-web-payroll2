class CreateSalaryAllotments < ActiveRecord::Migration
  def change
    create_table :salary_allotments do |t|
      t.integer :employee_id
      t.integer :employee_detail_id
      t.date :effective_date
      t.integer :salary_head_id
      t.decimal :salary_allotment, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end