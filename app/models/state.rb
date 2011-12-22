class State < ActiveRecord::Base
  has_many :employees#, :foreign_key => 'present_state_id'
end
