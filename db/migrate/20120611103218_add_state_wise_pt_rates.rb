class AddStateWisePtRates < ActiveRecord::Migration
  def change
    create_table :pt_slabs do |t|
      t.integer :state_id
      t.decimal :minimum_sal_range, :precision => 8, :scale => 2
      t.decimal :pt, :precision => 8, :scale => 2
      t.timestamps
    end
    add_index  :pt_slabs, :state_id
  end
end
