require 'spec_helper'

describe Salary do
  it "should return true (salary is generated for given employee for given month)" do
    salary = FactoryGirl.create(:salary)
    Salary.is_salary_generated?("02/2011", salary.employee_id).should be_true
  end
end