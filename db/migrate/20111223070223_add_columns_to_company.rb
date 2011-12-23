class AddColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :pt, :boolean
    add_column :companies, :tds, :boolean
    add_column :companies, :photo_file_name, :string
    add_column :companies, :photo_content_type, :string
    add_column :companies, :photo_file_size, :integer
  end
end
