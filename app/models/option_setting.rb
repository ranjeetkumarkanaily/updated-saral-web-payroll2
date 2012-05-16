class OptionSetting < ActiveRecord::Base
  attr_accessible :allow_brnch_admin, :appraisal, :approval_flow, :arrears, :asset_tracker, :attdn_intgration, :audit_trail, :bonus_and_exgratia, :country, :currency, :esi_applicable, :gratuity, :help_desk, :loans_adv, :lv_atdn_mgmt, :multi_branch, :multi_hr, :multi_pt, :multi_state_pt, :pf_applicable, :pt_applicable, :recruitment, :remibursement, :salary_calc, :tds_applicable, :time_zone, :training, :travel_cummute, :country_id

  belongs_to :country
  delegate :name, :to => :country, :prefix => true
end
