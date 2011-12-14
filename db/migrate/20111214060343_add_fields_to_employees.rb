class AddFieldsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :date_of_birth, :date
    add_column :employees, :marital_status, :string
    add_column :employees, :father_name, :string
    add_column :employees, :spouse_name, :string
    add_column :employees, :gender, :string
    add_column :employees, :present_res_no, :string
    add_column :employees, :present_res_name, :string
    add_column :employees, :present_street, :string
    add_column :employees, :present_locality, :string
    add_column :employees, :present_city, :string
    add_column :employees, :present_state_id, :integer
    add_column :employees, :perm_res_no, :string
    add_column :employees, :perm_res_name, :string
    add_column :employees, :perm_street, :string
    add_column :employees, :perm_locality, :string
    add_column :employees, :perm_city, :string
    add_column :employees, :perm_state_id, :integer
    add_column :employees, :perm_sameas_present, :bool
    add_column :employees, :email, :string
    add_column :employees, :mobile, :string
  end
end
