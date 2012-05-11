class CreateCompanyDocuments < ActiveRecord::Migration
  def change
    create_table :company_documents do |t|
      t.string :remarks
      t.integer :company_id

      t.timestamps
    end
  end
end
