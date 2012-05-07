class PtDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pt_group
  attr_accessible :pt_effective_date, :pt_group_id, :branch_id

  validates :branch_id, :pt_group_id, :pt_effective_date, :presence => true
  validates_uniqueness_of :pt_group_id, :scope => [:branch_id, :pt_effective_date]

  delegate :branch_name, :to => :branch, :prefix => true
  delegate :name, :to => :pt_group, :prefix => true
  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    next_row ? next_row.pt_effective_date - 1 : 'Till Date'
  end

  scope :effective_date, lambda { |branch_id,pt_group_id|
    {
        :conditions => ["branch_id = ? and pt_group_id = ?", branch_id, pt_group_id]
    }
  }
end
