class CompanyDocument < ActiveRecord::Base
  attr_accessible :company_id,:file_path,:remarks
  belongs_to :company
  has_attached_file :file_path
  validate :file_size, :file_content_type
  validates :file_path_file_name, presence: true

  def file_size
    upld = UploadFileType.first
    validates_attachment_size :file_path, :less_than => upld.max_file_size.to_i.megabytes
    puts file_content_type
  end

  def file_content_type
    upld = UploadFileType.first
    if upld.file_type =="all"
      validates_attachment_content_type :file_path
    else
      validates_attachment_content_type :file_path, :content_type => UploadFileType.validate_file_type(upld.file_type)
    end
  end
end