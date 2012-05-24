class CreateCountryTable < ActiveRecord::Migration
  def up
    create_table :countries do |t|
      t.string :name
      t.string :currency

      t.timestamps
    end
  end

  def down
    drop_table :countries
  end
end
