class AddForeignKeys < ActiveRecord::Migration
  def self.up
    add_foreign_key :branches, :pf_groups
    add_foreign_key :branches, :pt_groups
    add_foreign_key :branches, :esi_groups
  end
end