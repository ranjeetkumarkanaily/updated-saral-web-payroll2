class CreatePfEsiRates < ActiveRecord::Migration
  def change
    create_table :pf_esi_rates do |t|
      t.references :paymonth
      t.decimal :pf_rate, :precision => 8, :scale => 2
      t.decimal :pf_cutoff, :precision => 8, :scale => 2
      t.decimal :esi_employee_rate, :precision => 8, :scale => 2
      t.decimal :esi_employer_rate, :precision => 8, :scale => 2
      t.decimal :esi_cutoff, :precision => 8, :scale => 2
      t.timestamps
    end
    add_index :paymonths, :month_year
  end
end
