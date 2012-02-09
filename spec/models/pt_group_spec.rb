require 'spec_helper'

describe PtGroup do
  it { should belong_to(:state)}

  it { should have_many(:branches)}

  it { should have_many(:pt_rates)}
end