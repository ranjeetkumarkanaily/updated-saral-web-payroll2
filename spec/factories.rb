# By using the symbol ':employee', we get Factory Girl to simulate the Employee model.
FactoryGirl.define do
  factory :lop do
    employee
    month_year "Jan/2011"
    lop 1
  end
end
