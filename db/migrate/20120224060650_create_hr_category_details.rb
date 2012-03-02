class CreateHrCategoryDetails < ActiveRecord::Migration
  def up
    create_table :hr_category_details do |t|
      t.references :hr_category
      t.string :name
      t.string :data_type
      t.boolean :required

      t.timestamps
    end
    add_index :hr_category_details, :hr_category_id
    add_foreign_key :hr_category_details, :hr_categories
  end

  def down
    drop_table :hr_category_details
  end
end
