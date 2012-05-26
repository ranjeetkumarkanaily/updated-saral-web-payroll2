require 'spec_helper'

describe SalaryGroupDetail do
  describe "Association" do
    it { should belong_to(:salary_group)}

    it { should belong_to(:salary_head)}

    it { should belong_to(:paymonth)}

    it { should have_many(:salary_allotments)}

    it { should have_many(:salaries)}
  end
end
