class AddLeavingReasonToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :leaving_reason,:string
  end
end
