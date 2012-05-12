class AddFieldsToEmployeeStatutory < ActiveRecord::Migration
  def change
    add_column :employee_statutories, :zero_pt, :boolean
    add_column :employee_statutories, :zero_pension, :boolean
    add_column :employee_statutories, :vol_pf, :boolean
    add_column :employee_statutories, :vol_pf_percentage,:float
    add_column :employee_statutories, :vol_pf_amount, :float,:precision => 8, :scale => 2
  end
end
