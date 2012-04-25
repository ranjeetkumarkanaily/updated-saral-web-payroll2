class PfDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pf_group
  attr_accessible :pf_effective_date, :pf_group_id, :branch_id

  validates :branch_id, :pf_group_id, :pf_effective_date, :presence => true
  validates_uniqueness_of :pf_group_id, :scope => [:branch_id, :pf_effective_date]


  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.pf_effective_date - 1 : 'Till Date'
  end
end
