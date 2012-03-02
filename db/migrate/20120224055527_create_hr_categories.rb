class CreateHrCategories < ActiveRecord::Migration
  def up
    create_table :hr_categories do |t|
      t.string :category_name

      t.timestamps
    end
  end

  def down
    drop_table :hr_categories
  end
end
