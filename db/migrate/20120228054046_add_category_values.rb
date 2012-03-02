class AddCategoryValues < ActiveRecord::Migration
  def up
    add_column :hr_masters, :category_values, :hstore
  end

  def down
    remove_column :hr_masters, :category_values
  end
end
