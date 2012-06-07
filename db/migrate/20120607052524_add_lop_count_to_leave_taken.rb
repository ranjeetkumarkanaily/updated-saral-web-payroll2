class AddLopCountToLeaveTaken < ActiveRecord::Migration
  def change
    add_column :leave_takens, :lop_count,:decimal, :precision => 8, :scale => 2
  end
end
