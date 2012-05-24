class RenameColumnCountryTo < ActiveRecord::Migration
  def up
    rename_column :option_settings, :country, :country_id
  end

  def down
  end
end
