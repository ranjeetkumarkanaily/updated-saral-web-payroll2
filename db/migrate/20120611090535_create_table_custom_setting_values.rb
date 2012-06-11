class CreateTableCustomSettingValues < ActiveRecord::Migration
  def up
    create_table :custom_setting_values do  |t|
      t.string :group
      t.string :group_column
      t.string :group_column_value
      t.timestamps
    end
  end

  def down
    drop_table :custom_setting_values
  end
end
