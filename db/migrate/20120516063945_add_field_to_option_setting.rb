class AddFieldToOptionSetting < ActiveRecord::Migration
  def change
    remove_column :option_settings, :salary_calc
    add_column :option_settings, :salary_calc, :integer
    add_column :option_settings, :voluntary_pf, :boolean, :default => false
  end
end
