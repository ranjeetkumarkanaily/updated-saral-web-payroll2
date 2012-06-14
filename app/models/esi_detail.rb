class EsiDetail < ActiveRecord::Base
  belongs_to :branch
  belongs_to :esi_group
  attr_accessible :esi_effective_date, :esi_group_id, :branch_id

  validates :branch_id, :esi_group_id, :esi_effective_date, :presence => true
  validates_uniqueness_of :esi_group_id, :scope => [:branch_id, :esi_effective_date]


  delegate :esi_group_name, :to => :esi_group, :prefix => true
  delegate :branch_name, :to => :branch, :prefix => true


  def effective_to
    next_row = self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC")
    if next_row
      (next_row.esi_effective_date - 1).strftime(OptionSetting.date_format_value)
    else
      'Till Date'
    end
  end

  scope :effective_date, lambda { |branch_id,esi_group_id|
    {
        :conditions => ["branch_id = ? and esi_group_id = ?", branch_id, esi_group_id]
    }
  }

end
