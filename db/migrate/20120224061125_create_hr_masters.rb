class CreateHrMasters < ActiveRecord::Migration
  def up
    create_table :hr_masters do |t|
      t.references :hr_category
      t.references :employee

      t.timestamps
    end
    add_index :hr_masters, :hr_category_id
    add_index :hr_masters, :employee_id

    add_foreign_key :hr_masters, :hr_categories
    add_foreign_key :hr_masters, :employees

  end

  def down
    drop_table :hr_masters
  end
end
