class AddDateFieldFormatToOptionSetting < ActiveRecord::Migration
  def change
    add_column :option_settings, :date_format, :string
  end
end
