class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :empname
      t.datetime :date_of_joining
      t.datetime :date_of_leaving

      t.timestamps
    end
  end
end
