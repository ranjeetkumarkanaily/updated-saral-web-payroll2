class AddExtraColumnToSalaries < ActiveRecord::Migration
  def change
    add_column :salaries, :pay_days,:integer
    add_column :salaries, :present_days,:integer
  end
end
