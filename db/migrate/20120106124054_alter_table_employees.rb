class AlterTableEmployees < ActiveRecord::Migration
  def self.up
    add_foreign_key :employees, :grades
  end
end