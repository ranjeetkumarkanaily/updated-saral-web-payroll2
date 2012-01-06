class AlterTables < ActiveRecord::Migration
  def self.up
    add_foreign_key :employees, :designations
    add_foreign_key :employees, :departments
  end
end