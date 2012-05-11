class AddFieldsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :probation_period, :integer
    add_column :employees, :probation_complete_date, :date
    add_column :employees, :confirmation_date, :date
    add_column :employees, :salary_start_date, :date
    add_column :employees, :retirement_date, :date
    add_column :employees, :handicapped, :boolean
    add_column :employees, :emergency_contact_number, :string
    add_column :employees, :official_mail_id, :string
  end
end
