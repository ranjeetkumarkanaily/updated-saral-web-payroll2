class AddColumnToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :branch_id, :integer
    add_column :employees, :financial_institution_id, :integer
    add_column :employees, :bank_account_number, :string
    add_foreign_key :employees, :branches
    add_foreign_key :employees, :financial_institutions
  end
end