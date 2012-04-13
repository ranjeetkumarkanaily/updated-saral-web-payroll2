class AddPanToEmployeesTable < ActiveRecord::Migration
  def change
    add_column :employees, :pan, :string
    add_column :employees, :pan_effective_date, :date
  end
end
