require 'spec_helper'

describe SalaryAllotment do
  it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}
end