class Company < ActiveRecord::Base
  attr_accessible :companyname, :responsible_person, :address, :website, :dateofestablishment,:pf,:esi, :phonenumber1, :phonenumber2 , :address2, :address3, :email, :pt, :tds, :photo
  acts_as_audited

  has_many :company_documents

  regex_for_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :companyname, :presence => true,
                        :length   => {:maximum => 100}

  validates :responsible_person, :presence => true,
                                :length => {:maximum => 100}

  validates :address, :presence => true,
                    :length => {:maximum => 200}

  validates :email, :format => {:with => regex_for_email }, :allow_blank => true, :allow_nil => true

  validates :dateofestablishment, :presence => true

  has_attached_file :photo, :styles => { :logo => ["100x35", :png]}

  #validates :website, :format => /^(((h|H?)(t|T?)(t|T?)(p|P?)(s|S?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]*$/

  def self.backup_db option
    config = ActiveRecord::Base.configurations[Rails.env]
    latest_dump = "#{Rails.root}/public/system/Backup-#{Time.now.strftime('%d-%m-%Y-%Hh%Mm%Ss')}.db"
    file = File.new(latest_dump, "w")
    case option
      when "Schema"
        system("pg_dump --schema-only --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{file.path}")

      when "Skeleton"
        schema_file = File.new("schema","w")
        system("pg_dump --schema-only  --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{schema_file.path}")
        data_file = File.new("data","w")
        #tables = ["countries", "companies", "company_documents", "classification_headings", "classifications", "hr_categories", "hr_category_details","leave_definitions", "states", "upload_file_types", "users"]
        pg_dump_skltn = "pg_dump --data-only --table=countries --table=companies --table=company_documents --table=classification_headings --table=classifications --table=hr_categories --table=hr_category_details --table=leave_definitions --table=states --table=upload_file_types --table=users --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{data_file.path}"
        system("#{pg_dump_skltn}")
        merged_two_files schema_file, data_file, latest_dump

      when "Schema with data"
        system("pg_dump --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{file.path}")

      when "Data Only"
        system("pg_dump --data-only --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{file.path}")
    end
    BackupUtility.create!(:backup_date => Time.now.strftime('%d-%m-%Y'), :file_hash => file.hash, :employees_count => Employee.count, :last_sal_calculated => Salary.maximum(:effective_date), :backup_option => option, :file_name => File.basename(file))
    file
  end

  def self.restore_db file_path
    config = ActiveRecord::Base.configurations[Rails.env]
    pg_db_restore = "pg_restore --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -d #{config['database']} #{file_path}"
    system("#{pg_db_restore}")
  end

  def self.merged_two_files file1, file2, result_file
    fyl1 = File.readlines(file1.path)
    fyl2 = File.readlines(file2.path)

    File.open(result_file, "w") do |merged_file|
      merged_file.puts fyl1 + fyl2
    end
    FileUtils.rm_r(file1.path)
    FileUtils.rm_r(file2.path)
  end
end
