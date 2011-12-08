require 'spec_helper'

describe SalaryGroupDetail do
  describe "Association" do
    it { should belong_to(:salary_group)}
    it { should belong_to(:salary_head)}
  end
end
