class CreatePtRates < ActiveRecord::Migration
  def change
    create_table :pt_rates do |t|
      t.references :PtGroup
      t.references :paymonth
      t.decimal :min_sal_range
      t.decimal :max_sal_range
      t.decimal :pt

      t.timestamps
    end
    add_index :pt_rates, :PtGroup_id
    add_index :pt_rates, :paymonth_id
  end
end
