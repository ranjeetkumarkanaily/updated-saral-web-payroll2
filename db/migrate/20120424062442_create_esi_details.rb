class CreateEsiDetails < ActiveRecord::Migration
  def change
    create_table :esi_details do |t|
      t.references :branch
      t.references :esi_group
      t.date :esi_effective_date

      t.timestamps
    end
    add_index :esi_details, :branch_id
    add_index :esi_details, :esi_group_id
  end
end
