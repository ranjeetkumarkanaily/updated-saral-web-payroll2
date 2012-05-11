class AddColumnsToPfGroup < ActiveRecord::Migration
  def change
    add_column :pf_groups, :user_id, :string
    add_column :pf_groups, :password, :string
  end
end
