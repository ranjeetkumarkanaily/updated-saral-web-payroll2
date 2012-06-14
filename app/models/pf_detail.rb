class PfDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :pf_group
  attr_accessible :pf_effective_date, :pf_group_id, :branch_id

  validates :branch_id, :pf_group_id, :pf_effective_date, :presence => true
  validates_uniqueness_of :pf_group_id, :scope => [:branch_id, :pf_effective_date]

  delegate :pf_group, :to => :pf_group, :prefix => true
  delegate :branch_name, :to => :branch, :prefix => true

  #scope :next_rows, lambda { |created_at|
  #  {
  #      :conditions => ["created_at > ?", created_at]
  #  }
  #}

  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    if next_row
      (next_row.pf_effective_date-1).strftime(OptionSetting.date_format_value)
    else
      'Till Date'
    end
  end

  scope :effective_date, lambda { |branch_id,pf_group_id|
    {
        :conditions => ["branch_id = ? and pf_group_id = ?", branch_id, pf_group_id]
    }
  }
end
