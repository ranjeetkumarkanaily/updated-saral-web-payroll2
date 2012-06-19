class ClassificationHeading < ActiveRecord::Base
  attr_accessible :classification_heading_name,:display_order
  acts_as_audited

  has_many :classifications, :dependent => :restrict
  belongs_to :employee_detail

  validates :classification_heading_name ,
            :presence => true,
            :uniqueness => {:case_sensitive => false}

  validates :display_order ,:presence => true,:format => { :with => /[1-9]/ ,:message => "is invalid, Please enter only numbers from 1 to 9" } ,:uniqueness => true

end
