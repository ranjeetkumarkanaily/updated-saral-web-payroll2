class PtGroup < ActiveRecord::Base
  belongs_to :state
  validates_presence_of :state_id, :name, :address
  validates_uniqueness_of :name
  has_many :pt_rates
  has_many :branches

end
