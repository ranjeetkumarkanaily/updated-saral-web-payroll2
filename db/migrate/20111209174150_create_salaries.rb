class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.date :effective_date
      t.decimal :salary_amount, :precision => 8, :scale => 2
      t.references :employee
      t.references :employee_detail
      t.references :salary_head

      t.timestamps
    end
    add_index :salaries, :employee_id
    add_index :salaries, :employee_detail_id
    add_index :salaries, :salary_head_id
  end
end
