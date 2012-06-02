class EmployeeStatutory < ActiveRecord::Base

  belongs_to :employee

  attr_accessible :employee_id, :esi_effective_date, :esi_number, :pan, :pan_effective_date, :pf_effective_date, :pf_number,:zero_pt,:zero_pension,:vol_pf,:vol_pf_percentage,:vol_pf_amount,:based_on
  acts_as_audited

  regex_for_pan = /(PAN Not Avbl)|(PAN Applied)|(PAN Invalid)|([a-z]{5}[0-9]{4}[a-z]{1})/i

  validates :pan,   :presence   => true, :allow_blank => true,
            :format     => { :with => regex_for_pan }

  validates :pan_effective_date, :presence => true, :if => :pan_present?

  validates :pf_effective_date, :presence => true, :if => :pf_present?

  validates :esi_effective_date, :presence => true, :if => :esi_present?

  def esi_present?
    !esi_number.nil? and !esi_number.empty?
  end

  def pf_present?
    !pf_number.nil? and !pf_number.empty?
  end

  def pan_present?
    pan != 'PAN Applied' and pan != 'PAN Invalid' and pan != 'PAN Not Avbl'
  end

  def update_details
    self.pf_effective_date = '' if self.pf_number.blank?
    self.esi_effective_date = '' if self.esi_number.blank?
    self.pan_effective_date = '' if !pan_present?
    self.save
  end

  scope :zero_pension, lambda {|employee_id|
    where("zero_pension = true and employee_id = #{employee_id}")
  }

  scope :vol_pf, lambda {|employee_id|
    where("vol_pf = true and employee_id = #{employee_id}")
  }

  scope :vol_pf_percentage, lambda {|employee_id|
    where("vol_pf_percentage IS NOT NULL and vol_pf_percentage > 0 and employee_id = #{employee_id}")
  }

  def self.get_vol_pf_amount employee_id, pf_applicable_amount
    if (EmployeeStatutory.vol_pf employee_id).empty?
      vol_pf_amount = 0
    else
      if (EmployeeStatutory.vol_pf_percentage employee_id).empty?
        vol_pf_amount = EmployeeStatutory.select("vol_pf_amount").where("employee_id = #{employee_id}")[0].vol_pf_amount
      else
        volPF_percent = EmployeeStatutory.select("vol_pf_percentage").where("employee_id = #{employee_id}")[0].vol_pf_percentage
        vol_pf_amount = (pf_applicable_amount * volPF_percent)/100
      end
    end
  end
end
