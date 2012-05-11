class AddColumnsToCompanyDocument < ActiveRecord::Migration
  def change
    add_column :company_documents, :file_path_file_name, :string
    add_column :company_documents, :file_path_content_type, :string
    add_column :company_documents, :file_path_file_size, :integer
  end
end
