class AddLeaveDefinitionIdToLeaveDetails < ActiveRecord::Migration
  def change
    add_column :leave_details, :leave_definition_id, :integer
    add_index :leave_details, :leave_definition_id
    add_foreign_key :leave_details, :leave_definitions
    add_foreign_key :leave_details, :employees
  end
end
