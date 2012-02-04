class CreateEsiGroups < ActiveRecord::Migration
  def change
    create_table :esi_groups do |t|
      t.string :esi_group_name
      t.string :address
      t.string :esi_no
      t.string :esi_local_office

      t.timestamps
    end
  end
end
