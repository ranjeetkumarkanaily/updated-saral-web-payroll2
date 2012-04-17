class BranchPfDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pf_group
end
