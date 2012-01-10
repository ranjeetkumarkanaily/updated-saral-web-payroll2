require 'spec_helper'

describe PtGroup do
  it { should belong_to(:state)}
end