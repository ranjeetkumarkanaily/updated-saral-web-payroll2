require 'spec_helper'

describe HrMaster do

  it { should belong_to(:employee)}
  it { should belong_to(:hr_category)}
end