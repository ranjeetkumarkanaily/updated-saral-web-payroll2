class CreateEsiCalculatedValues < ActiveRecord::Migration
  def change
    create_table :esi_calculated_values do |t|
      t.decimal :esi_gross, :precision => 8, :scale => 2
      t.decimal :esi_amount, :precision => 8, :scale => 2
      t.decimal :esi_employer_amount, :precision => 8, :scale => 2
      t.references :employee
      t.date :effective_date

      t.timestamps
    end
    add_index :esi_calculated_values, :employee_id
    add_foreign_key :esi_calculated_values, :employees
  end
end
