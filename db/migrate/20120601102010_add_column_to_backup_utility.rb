class AddColumnToBackupUtility < ActiveRecord::Migration
  def change
    add_column :backup_utilities, :file_name,:string
  end
end
