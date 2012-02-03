class CreateClassificationHeadings < ActiveRecord::Migration
  def change
    create_table :classification_headings do |t|
      t.string :classification_heading_name
      t.integer :display_order

      t.timestamps
    end
  end
end
