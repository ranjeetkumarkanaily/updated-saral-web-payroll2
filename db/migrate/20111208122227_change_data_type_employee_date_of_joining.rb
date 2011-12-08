class ChangeDataTypeEmployeeDateOfJoining < ActiveRecord::Migration
    def up
      change_table :employees do |t|
      t.change :date_of_joining, :date
      t.change :date_of_leaving, :date
    end

    def down
    end
  end
end
