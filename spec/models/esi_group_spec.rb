require 'spec_helper'

describe EsiGroup do
  it { should have_many(:branches)}

  it { should have_many(:esi_group_rates)}

end
