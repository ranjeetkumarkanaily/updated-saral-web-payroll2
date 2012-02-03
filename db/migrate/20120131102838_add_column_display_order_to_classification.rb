class AddColumnDisplayOrderToClassification < ActiveRecord::Migration
  def change
    add_column :classifications, :display_order, :integer
  end
end
