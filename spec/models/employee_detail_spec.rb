require 'spec_helper'

describe EmployeeDetail do
  it { should belong_to(:employee)}

  it { should belong_to(:salary_group)}

  it { should have_many(:salary_allotments)}
end
