class AddRefnoToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :refno, :string
  end
end
