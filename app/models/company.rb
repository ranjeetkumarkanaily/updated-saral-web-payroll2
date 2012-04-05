class Company < ActiveRecord::Base
  attr_accessible :id,:companyname, :responsible_person, :address, :website, :dateofestablishment,:pf,:esi, :phonenumber1, :phonenumber2 , :address2, :address3, :email, :pt, :tds, :photo_file_name, :photo_content_type, :photo_file_size, :created_at,:updated_at
  acts_as_audited

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

end
