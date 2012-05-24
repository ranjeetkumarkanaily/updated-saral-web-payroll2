class CreateLeaveOpeningBalances < ActiveRecord::Migration
  def change
    create_table :leave_opening_balances do |t|
      t.references :leave_definition
      t.references :employee
      t.float :opening_balance

      t.timestamps
    end
    add_index :leave_opening_balances, :leave_definition_id
    add_index :leave_opening_balances, :employee_id

    add_foreign_key :leave_opening_balances, :leave_definitions
    add_foreign_key :leave_opening_balances, :employees

  end
end
