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

  def self.backup_db
    config = ActiveRecord::Base.configurations[Rails.env]
    latest_dump = "#{Rails.root}/public/system/Backup-#{Time.now.strftime('%d-%m-%Y-%Hh%Mm%Ss')}.db"
    file = File.new(latest_dump, "w")
    #pg_dump --data-only --host=localhost --port=5432 --username=postgres --no-password -Fc DocUpload_development > dump_docupload.db
    system("pg_dump --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -Fc #{config['database']} > #{file.path}")
    file
  end

  def self.restore_db file_path
    config = ActiveRecord::Base.configurations[Rails.env]
    #pg_restore --host=localhost --port=5432 --username=postgres --no-password -d DocUpload_development dump_docupload.db
    pg_db_restore = "pg_restore --host=#{config['host']} --port=#{config['port']} --username=#{config['username']} --no-password -d #{config['database']} #{file_path}"
    system("#{pg_db_restore}")
  end

end
