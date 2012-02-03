require 'spec_helper'

describe Evaluator do

  it "should evaluate formulas" do
    formula = "GROSS*40/100"
    values = {GROSS:40000.0}
    result = Evaluator.formula(formula,values)
    result.should eq(16000.00)
  end

  it "should expects an error" do
    formula = "system('rm -rf <root>')"
    values = {GROSS:40000.0}
    result = Evaluator.formula(formula,values)
    result.should raise_exception
  end

end
