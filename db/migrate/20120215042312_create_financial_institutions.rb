class CreateFinancialInstitutions < ActiveRecord::Migration
  def change
    create_table :financial_institutions do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :address_line4
      t.string :pincode
      t.string :branch_code
      t.string :email

      t.timestamps
    end
  end
end
