require 'spec_helper'

describe Branch do
  it { should belong_to(:pf_group)}

  it { should belong_to(:esi_group)}

  it { should belong_to(:pt_group)}

  it { should have_many(:employees)}
end
