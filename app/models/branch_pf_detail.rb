class BranchPfDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pf_group

  validates :branch_id, :pf_group_id, :pf_effective_date, :presence => true
  validates :pf_group_id, :uniqueness => true

  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.pf_effective_date - 1 : 'Till Date'
  end
end
