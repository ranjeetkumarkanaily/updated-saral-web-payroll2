class BackupUtility < ActiveRecord::Migration
 def change
   create_table :backup_utilities do |t|
     t.date :backup_date
     t.integer :file_hash
     t.integer :employees_count
     t.date :last_sal_calculated
     t.string :backup_option

     t.timestamps
   end
 end
end
