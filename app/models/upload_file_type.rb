class UploadFileType < ActiveRecord::Base
  attr_accessible :file_type, :max_file_size

  def self.validate_file_type file_types
    file_types.split(',')
  end
end
