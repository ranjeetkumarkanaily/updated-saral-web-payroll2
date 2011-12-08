class CreateLops < ActiveRecord::Migration
  def change
    create_table :lops do |t|
      t.integer :employee_id
      t.string :month_year
      t.float :lop

      t.timestamps
    end
  end
end