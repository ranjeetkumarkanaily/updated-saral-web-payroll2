class AddColumnToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :esi_applicable, :boolean
  end
end