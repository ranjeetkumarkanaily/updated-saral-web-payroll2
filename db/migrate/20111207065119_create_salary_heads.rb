class CreateSalaryHeads < ActiveRecord::Migration
  def change
    create_table :salary_heads do |t|
      t.string :head_name
      t.string :short_name
      t.string :salary_type

      t.timestamps
    end
  end
end
