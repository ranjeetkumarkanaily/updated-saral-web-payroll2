class CreatePaymonths < ActiveRecord::Migration
  def change
    create_table :paymonths do |t|
      t.integer :month_year
      t.integer :number_of_days
      t.date :from_date
      t.date :to_date
      t.string :month_name

      t.timestamps
    end
  end
end
