class CreateDefaultValues < ActiveRecord::Migration
  def change
    create_table :default_values do |t|
      t.string :default_type
      t.string :value
      t.integer :value_id

      t.timestamps
    end
  end
end
