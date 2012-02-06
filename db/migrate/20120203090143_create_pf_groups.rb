class CreatePfGroups < ActiveRecord::Migration
  def change
    create_table :pf_groups do |t|
      t.string :pf_group
      t.string :pf_number
      t.string :db_file_code
      t.integer :extension
      t.string :address

      t.timestamps
    end
  end
end
