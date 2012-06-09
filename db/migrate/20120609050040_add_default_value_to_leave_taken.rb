class AddDefaultValueToLeaveTaken < ActiveRecord::Migration
  def change
    remove_column :leave_takens, :leave_count
    remove_column :leave_takens, :lop_count

    add_column :leave_takens, :lop_count,:decimal, :precision => 8, :scale => 2,:default=>0
    add_column :leave_takens, :leave_count,:decimal, :precision => 8, :scale => 2,:default=>0

  end
end
