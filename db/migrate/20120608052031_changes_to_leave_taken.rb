class ChangesToLeaveTaken < ActiveRecord::Migration
  def change
    rename_column :leave_takens, :count, :leave_count
    rename_column :leave_takens, :from_date, :leave_from_date

    add_column :leave_takens, :leave_detail_date,:string
    add_column :leave_takens, :leave_to_date,:date

    add_column :leave_takens, :lop_from_date,:date
    add_column :leave_takens, :lop_to_date,:date


  end
end
