class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string   :companyname
      t.string   :responsible_person
      t.string   :address
      t.string   :website
      t.date     :dateofestablishment
      t.boolean  :pf
      t.boolean  :esi
      t.string   :phonenumber1
      t.string   :phonenumber2
      t.string   :address2
      t.string   :address3
      t.string   :email
      t.timestamps
    end
  end
end