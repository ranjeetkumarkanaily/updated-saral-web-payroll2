class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.integer :attendance_configuration_id
      t.date :holiday_date
      t.string :description
      t.boolean :national_holiday

      t.timestamps
    end
    add_foreign_key :holidays, :attendance_configurations
  end
end
