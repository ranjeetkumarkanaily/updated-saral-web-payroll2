class AddMoreColumnSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :actual_salary_amount, :decimal, :precision => 8, :scale => 2
  end
end
