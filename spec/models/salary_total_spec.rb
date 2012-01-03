require 'spec_helper'

describe SalaryTotal do

  it { should belong_to(:employee)}

  it { should belong_to(:month_year)}



end
