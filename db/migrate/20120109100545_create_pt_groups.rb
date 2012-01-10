class CreatePtGroups < ActiveRecord::Migration
  def change
    create_table :pt_groups do |t|
      t.string :name
      t.references :state
      t.string :certificate_no
      t.string :pto_circle_no
      t.string :address
      t.string :return_period

      t.timestamps
    end
    add_index :pt_groups, :state_id
  end
end
