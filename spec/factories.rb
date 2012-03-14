# By using the symbol ':employee', we get Factory Girl to simulate the Employee model.
FactoryGirl.define do
  factory :employee do
    id 1
    refno 1001
    email "test@test.com"
    present_state_id "1"
    empname "XYZ"
    date_of_joining "2011-02-01"
    date_of_leaving ""
    restrct_pf false
  end

  factory :lop do
    employee
    month_year "Jan/2011"
    lop 1
  end

  factory :salary_head do
    head_name "Basic"
    short_name "BASIC"
    salary_type "Earnings"
  end

  factory :salary_group do
    salary_group_name "Manager"
    based_on_gross false
  end

 factory :salary_allotment do
    employee_id 1
    employee_detail_id 1
    effective_date '2011-02-01'
    salary_head
    salary_allotment 1000.00
    salary_group_detail_id 1
  end

  factory :salary do
    effective_date '2011-02-01'
    salary_amount 1000.00
    employee_id 1
    employee_detail_id 1
    salary_head
  end

  factory :salary_group_detail do
    salary_group_id 1
    salary_head
    calc_type 'Lumpsum'
    calculation ""
    based_on "PayDays"
  end

  factory :employee_detail do
    employee_id  1
    effective_date "2009-10-31"
    salary_group_id 1
    allotted_gross 5000
    classification {'Department => development'}
    branch_id 1
    financial_institution_id  1
    attendance_configuration_id  2
    bank_account_number 2316
    effective_to  ''
  end

  factory :state do
    state_name "Karnataka"
  end

  factory :leave_detail do
    employee
    leave_date '2011-01-01'
  end

 factory :paymonth do
    month_year 24132
    number_of_days 31
    from_date "2010-12-01"
    to_date "2010-12-31"
    month_name  "Dec/2010"
  end

  factory :pf_esi_rate do
    paymonth
    pf_rate 12.03
    pf_cutoff 1522
    esi_employee_rate 12.03
    esi_employer_rate 6.03
    esi_cutoff 1500
  end

  factory :pt_group do
    name "Group"
    certificate_no "123456"
    pto_circle_no "123456"
    address "Bangalore"
    return_period "Monthly"
    state_id 1
  end

  factory :pt_group_rate do
    pt_group
    paymonth
  end

  factory :pt_rate do
    pt_group
    paymonth
    min_sal_range 0.0
    max_sal_range 5000.0
    pt 100.0
  end


  factory :classification_heading do
    classification_heading_name "Department"
    display_order 1
  end

  factory :classification do
    classification_heading_id 1
    classification_name "WDO"
  end

  factory :attendance_configuration do
    id 2
    attendance "Karnataka"
    short_name "KARNATAKA"
    salary_calendar_days "Actual Days / Month"
  end

  factory :holiday do
    attendance_configuration
    holiday_date "2012-01-26"
    description "Republic Day"
    national_holiday true

  end

  factory :pf_group do
    pf_group "Kar"
    pf_number "ka1201"
    db_file_code "10210"
    extension 1
    address "bangalore"
  end

  factory :esi_group do
    esi_group_name "Karnataka"
    address "12 Street"
    esi_no "3432VD"
    esi_local_office "Bangalore"
  end

  factory :financial_institution do
    id 2
    name "State Bank of India"
    address_line1 "123 Street"
    address_line2 "Mahalakshmipuram"
    address_line3 "West of Chord Road"
    address_line4 "Bangalore,Karnataka"
    pincode "560086"
    branch_code "SBI000434"
    email "sbi@gmail.com"
  end

  factory :branch do
    id 1
    branch_name "Bangalore"
    responsible_person "rahul"
    address "Bangalore"
    pf_group
    esi_group
    pt_group
    esi_applicable false
  end

  factory :hr_category do
    category_name "Family"
  end

  factory :hr_category_detail do
    hr_category
    name "Name"
    data_type "String"
    required true
  end

  factory :hr_master do
    hr_category
    employee
    category_values {'Name => Kanaily'}
  end

end
