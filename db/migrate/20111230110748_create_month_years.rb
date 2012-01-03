class CreateMonthYears < ActiveRecord::Migration
  def change
    create_table :month_years do |t|
      t.integer :month_year
      t.integer :number_of_days
      t.date :from_date
      t.date :to_date
      t.string :month_name
      t.timestamps
    end
  end
end
