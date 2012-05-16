class CreateLeaveDefinitions < ActiveRecord::Migration
  def change
    create_table :leave_definitions do |t|
      t.string :leave_name
      t.string :short_name

      t.timestamps
    end
  end
end
