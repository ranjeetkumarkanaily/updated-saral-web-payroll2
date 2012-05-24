class RenameColumnNameOfOptionSettings < ActiveRecord::Migration
  def up
    remove_column :option_settings, :salary_calc
    add_column :option_settings, :salary_calc, :string
  end

  def down
  end
end
