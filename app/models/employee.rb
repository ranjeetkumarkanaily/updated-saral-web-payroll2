class Employee < ActiveRecord::Base

  regex_for_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :employee_details, :dependent => :destroy

  belongs_to :state, :foreign_key => :present_state_id

  validates :empname, :presence => true,
                    :length   => {:maximum => 100}
  validates :present_state_id, :presence => true

  validates :date_of_joining, :presence => true

  validates :refno,   :presence   => true,
                    :uniqueness => { :case_sensitive => false }


  validates :email,   :presence   => true,
                    :format     => { :with => regex_for_email },
                    :uniqueness => { :case_sensitive => false }

  validate :doj_before_dol


  def doj_before_dol
    if !date_of_joining.nil? and !date_of_leaving.nil? and date_of_joining >= date_of_leaving then
      errors.add(:date_of_joining, "date of joining should be before date of leaving")
    end
  end

end