require 'spec_helper'

describe PfGroup do
  it { should have_many(:pf_group_rates)}

  it { should have_many(:branches)}
end
