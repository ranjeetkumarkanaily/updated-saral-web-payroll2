require 'spec_helper'

describe Grade do
  before(:each) do
    @attr = {
        :grade => 'First'
    }
  end

  it { should have_many(:employees)}

  it "should require a grade" do
    no_grade = Grade.new(@attr.merge(:grade => ""))
    no_grade.should_not be_valid
  end

  it "rejects duplicate grade" do
    Grade.create!(@attr)
    duplicate_grade = Grade.new(@attr)
    duplicate_grade.should_not be_valid
  end

  it "rejects grade identical up to case" do
    upcased_grade = @attr[:grade].upcase
    Grade.create!(@attr.merge(:grade => upcased_grade))
    duplicate_grade = Grade.new(@attr)
    duplicate_grade.should_not be_valid
  end
end
