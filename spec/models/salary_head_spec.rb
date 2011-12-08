require 'spec_helper'

describe SalaryHead do
  it { should have_many(:salary_group_details)}
end
