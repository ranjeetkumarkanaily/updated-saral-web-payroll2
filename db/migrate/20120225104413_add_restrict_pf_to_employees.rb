class AddRestrictPfToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :restrct_pf, :boolean, :default => false
  end
end
