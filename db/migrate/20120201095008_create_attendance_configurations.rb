class CreateAttendanceConfigurations < ActiveRecord::Migration
  def change
    create_table :attendance_configurations do |t|
      t.string :attendance
      t.string :short_name
      t.string :salary_calendar_days

      t.timestamps
    end
  end
end
