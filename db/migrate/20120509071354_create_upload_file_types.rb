class CreateUploadFileTypes < ActiveRecord::Migration
  def change
    create_table :upload_file_types do |t|
      t.integer :max_file_size
      t.string :file_type

      t.timestamps
    end
  end
end
