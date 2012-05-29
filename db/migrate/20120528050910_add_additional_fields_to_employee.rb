class AddAdditionalFieldsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :resignation_date, :date
    add_column :employees, :notice_period, :integer
    add_column :employees, :remarks, :text
  end
end
