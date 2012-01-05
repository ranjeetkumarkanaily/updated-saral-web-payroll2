class Company < ActiveRecord::Base

  regex_for_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :companyname, :presence => true,
                        :length   => {:maximum => 100}

  validates :responsible_person, :presence => true,
                                :length => {:maximum => 100}

  validates :address, :presence => true,
                    :length => {:maximum => 200}

  validates :email, :format => {:with => regex_for_email }, :allow_blank => true, :allow_nil => true

  validates :dateofestablishment, :presence => true

  has_attached_file :photo, :styles => { :logo => ["100x50", :png]}

  #validates :website, :format => /^(((h|H?)(t|T?)(t|T?)(p|P?)(s|S?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]*$/

end
