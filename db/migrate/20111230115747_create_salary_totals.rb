class CreateSalaryTotals < ActiveRecord::Migration
  def change
    create_table :salary_totals do |t|
      t.integer :employee_id
      t.integer :month_year_id
      t.decimal :alloted_gross, :precision => 8, :scale => 2
      t.decimal :earned, :precision => 8, :scale => 2
      t.decimal :deducted, :precision => 8, :scale => 2
      t.decimal :net_salary, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
