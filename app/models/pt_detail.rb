class PtDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pt_group
  attr_accessible :pt_effective_date, :pt_group_id, :branch_id

  validates :branch_id, :pt_group_id, :pt_effective_date, :presence => true
  validates_uniqueness_of :pt_group_id, :scope => [:branch_id, :pt_effective_date]


  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.pt_effective_date - 1 : 'Till Date'
  end
end
