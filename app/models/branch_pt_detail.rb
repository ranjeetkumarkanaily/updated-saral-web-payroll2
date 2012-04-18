class BranchPtDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pt_group

  validates :branch_id, :pt_group_id, :pt_effective_date, :presence => true
  validates :pt_group_id, :uniqueness => true

  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.pt_effective_date - 1 : 'Till Date'
  end
end