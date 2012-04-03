class User < ActiveRecord::Base
  acts_as_audited

  validates_presence_of :username, :password
  validates_length_of :password, :minimum => 6, :message => "length should be greater than or equal to 6"

  def self.authenticate(username, pass)
    user = find_by_username(username) && find_by_password(pass)
    return user if user
  end
end