require 'spec_helper'

describe Lop do
#pending "add some examples to (or delete) #{__FILE__}"

  describe "Association" do
    it { should belong_to(:employee)}
  end

end