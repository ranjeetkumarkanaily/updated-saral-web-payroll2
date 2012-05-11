class CompanyDocument < ActiveRecord::Base
  attr_accessible :company_id,:file_path,:remarks
  belongs_to :company
  has_attached_file :file_path
  #@file_specs=UploadFileType.first
  #validates_attachment_size :file_path, :less_than => @file_specs.max_file_size.megabyte
  #if @file_specs.file_type =="all"
  #  validates_attachment_content_type :file_path
  #else
  #  validates_attachment_content_type :file_path, :content_type => UploadFileType.validate_file_type(@file_specs.file_type)
  #end

  validates :file_path_file_name, presence: true
end