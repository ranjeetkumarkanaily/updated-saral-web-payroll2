class CreateOptionSettings < ActiveRecord::Migration
  def change
    create_table :option_settings do |t|
      t.string :country
      t.string :time_zone
      t.string :currency
      t.boolean :recruitment
      t.boolean :lv_atdn_mgmt
      t.boolean :appraisal
      t.boolean :training
      t.boolean :help_desk
      t.boolean :travel_cummute
      t.boolean :pf_applicable
      t.boolean :esi_applicable
      t.boolean :pt_applicable
      t.boolean :multi_state_pt
      t.boolean :multi_pt
      t.boolean :tds_applicable
      t.boolean :multi_branch
      t.boolean :multi_hr
      t.boolean :salary_calc
      t.boolean :allow_brnch_admin
      t.boolean :approval_flow
      t.boolean :audit_trail
      t.boolean :remibursement
      t.boolean :bonus_and_exgratia
      t.boolean :gratuity
      t.boolean :loans_adv
      t.boolean :arrears
      t.boolean :attdn_intgration
      t.boolean :asset_tracker

      t.timestamps
    end
  end
end
