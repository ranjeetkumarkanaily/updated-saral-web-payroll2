class LeaveDefinition < ActiveRecord::Base
  attr_accessible :leave_name, :short_name

  validates :leave_name, :presence => true , :uniqueness => true

  validates :short_name, :presence => true ,:uniqueness => true , :length => {:minimum => 1 , :maximum => 3}

  scope :definitions, :order => 'created_at DESC'

end
