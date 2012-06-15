class CreateDateFormats < ActiveRecord::Migration
  def change
    create_table :date_formats do |t|
      t.string :date_format
      t.string :date_format_value

      t.timestamps
    end
  end
end
