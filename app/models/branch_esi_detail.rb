class BranchEsiDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :esi_group

  validates :branch_id, :esi_group_id, :esi_effective_date, :presence => true
  validates :esi_group_id, :uniqueness => true

  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.esi_effective_date - 1 : 'Till Date'
  end
end