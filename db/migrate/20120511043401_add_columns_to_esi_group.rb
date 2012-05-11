class AddColumnsToEsiGroup < ActiveRecord::Migration
  def change
    add_column :esi_groups, :user_id, :string
    add_column :esi_groups, :password, :string
  end
end
