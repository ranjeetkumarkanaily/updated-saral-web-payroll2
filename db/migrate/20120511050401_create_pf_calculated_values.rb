class CreatePfCalculatedValues < ActiveRecord::Migration
  def change
    create_table :pf_calculated_values do |t|
      t.decimal :pf_earning, :precision => 8, :scale => 2
      t.decimal :pf_amount, :precision => 8, :scale => 2
      t.decimal :epf_amount, :precision => 8, :scale => 2
      t.decimal :eps_amount, :precision => 8, :scale => 2
      t.decimal :vol_pf_amount, :precision => 8, :scale => 2
      t.references :employee
      t.date :effective_date

      t.timestamps
    end
    add_index :pf_calculated_values, :employee_id
    add_foreign_key :pf_calculated_values, :employees
  end
end
