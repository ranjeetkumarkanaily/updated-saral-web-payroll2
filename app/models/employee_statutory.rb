class EmployeeStatutory < ActiveRecord::Base

  belongs_to :employee

  attr_accessible :employee_id, :esi_effective_date, :esi_number, :pan, :pan_effective_date, :pf_effective_date, :pf_number

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

end
