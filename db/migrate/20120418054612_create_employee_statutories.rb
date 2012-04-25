class CreateEmployeeStatutories < ActiveRecord::Migration
  def change
    create_table :employee_statutories do |t|
      t.references :employee
      t.string :pan
      t.date :pan_effective_date
      t.string :pf_number
      t.date :pf_effective_date
      t.string :esi_number
      t.date :esi_effective_date

      t.timestamps
    end
    add_index :employee_statutories, :employee_id
    add_foreign_key :employee_statutories, :employees
  end
end
