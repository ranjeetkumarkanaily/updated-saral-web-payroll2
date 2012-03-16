class AddEffectiveDateToPfGroupRate < ActiveRecord::Migration
  def change
    add_column :pf_group_rates, :effective_date, :date

  end
end
