namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create( :username => 'admin', :password => 'default' )
  end

  desc "Add Default Salary Heads"
  task :salary_head => :environment do
    SalaryHead.create( :head_name => 'Basic', :short_name => 'BASIC', :salary_type => "Earnings" )
    SalaryHead.create( :head_name => 'PF', :short_name => 'PF', :salary_type => "Deductions" )
    SalaryHead.create( :head_name => 'ESI', :short_name => 'ESI', :salary_type => "Deductions" )
  end

  desc "Add States"
  task :state => :environment do
    State.create( :state_name => 'Andhra Pradesh')
    State.create( :state_name => 'Arunachal Pradesh')
    State.create( :state_name => 'Assam')
    State.create( :state_name => 'Bihar')
    State.create( :state_name => 'Chhattisgarh')
    State.create( :state_name => 'Delhi')
    State.create( :state_name => 'Goa')
    State.create( :state_name => 'Gujarat')
    State.create( :state_name => 'Haryana')
    State.create( :state_name => 'Himachal Pradesh')
    State.create( :state_name => 'Jammu and Kashmir')
    State.create( :state_name => 'Jharkhand')
    State.create( :state_name => 'Karnataka')
    State.create( :state_name => 'Kerala')
    State.create( :state_name => 'Madhya Pradesh')
    State.create( :state_name => 'Maharastra')
    State.create( :state_name => 'Manipur')
    State.create( :state_name => 'Meghalaya')
    State.create( :state_name => 'Mizoram')
    State.create( :state_name => 'Nagaland')
    State.create( :state_name => 'Orrisa')
    State.create( :state_name => 'Panjab')
    State.create( :state_name => 'Pondicherry')
    State.create( :state_name => 'Rajasthan')
    State.create( :state_name => 'Sikkim')
    State.create( :state_name => 'Tamil Nadu')
    State.create( :state_name => 'Tripura')
    State.create( :state_name => 'Uttaranchal')
    State.create( :state_name => 'Uttar Pradesh')
  end

  desc "Add Default Attendance Configuration"
  task :attendance_configuration => :environment do
    AttendanceConfiguration.create( :attendance => '<Master List>', :short_name => 'MASTER', :salary_calendar_days => "Actual Day / Month" )
  end

  desc "Add Default Financial Institution"
  task :financial_institution => :environment do
    FinancialInstitution.create( :name => "CASH", :address_line1 => "address", :address_line2 => "address", :address_line3 => "address", :address_line4 => "address", :pincode => 560076, :branch_code => "branch_code", :email => "email" )
  end

  desc "Add Default Classification Designation"
  task :classification_heading => :environment do
    ClassificationHeading.create( :classification_heading_name => "Designation", :display_order => 1 )
    ClassificationHeading.create( :classification_heading_name => "Occupation", :display_order => 2 )
    ClassificationHeading.create( :classification_heading_name => "Department", :display_order => 3 )
    ClassificationHeading.create( :classification_heading_name => "Division", :display_order => 4 )
    ClassificationHeading.create( :classification_heading_name => "Grade", :display_order => 5 )
    ClassificationHeading.create( :classification_heading_name => "Section", :display_order => 6 )
  end

  desc "Add Default HR Categories"
  task :hr_category => :environment do
    desc "Creating HR Category Personal"
    personal = HrCategory.create(:category_name => "Personal")
    desc "Creating HR Category Details for Hr Category Personal"
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Blood Group", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Cast Category", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Qualification", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Nationality", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Driving Lic No", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => personal.id, :name => "Language Known", :data_type => "String", :required => false)

    desc "Creating HR Category Passport"
    passport = HrCategory.create(:category_name => "Passport")
    desc "Creating HR Category Details for Hr Category 'Passport'"
    HrCategoryDetail.create(:hr_category_id => passport.id, :name => "Number", :data_type => "Integer", :required => false)
    HrCategoryDetail.create(:hr_category_id => passport.id, :name => "Issued At", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => passport.id, :name => "Issued date", :data_type => "Date", :required => false)
    HrCategoryDetail.create(:hr_category_id => passport.id, :name => "Expiry Date", :data_type => "String", :required => false)


    desc "Creating HR Category Family"
    family = HrCategory.create(:category_name => "Family")
    desc "Creating HR Category Details for Hr Category 'Family'"
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Name Of Relative", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Relation", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Date of Birth", :data_type => "Date", :required => false)
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Dependent", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => family.id, :name => "Nominee", :data_type => "String", :required => false)

    desc "Creating HR Category Education"
    education = HrCategory.create(:category_name => "Education")
    desc "Creating HR Category Details for Hr Category 'Education'"
    HrCategoryDetail.create(:hr_category_id => education.id, :name => "Qualification", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => education.id, :name => "University", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => education.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => education.id, :name => "Percentage", :data_type => "Decimal", :required => false)
    HrCategoryDetail.create(:hr_category_id => education.id, :name => "Year Passed", :data_type => "Integer", :required => false)

    desc "Creating HR Category Training"
    training = HrCategory.create(:category_name => "Training")
    desc "Creating HR Category Details for Hr Category 'Training'"
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "Training Name", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "Location", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "Comments", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "From Date", :data_type => "Date", :required => false)
    HrCategoryDetail.create(:hr_category_id => training.id, :name => "To Date", :data_type => "Date", :required => false)

    desc "Creating HR Category Accident"
    accident = HrCategory.create(:category_name => "Accident")
    desc "Creating HR Category Details for Hr Category 'Accident'"
    HrCategoryDetail.create(:hr_category_id => accident.id, :name => "Accident", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => accident.id, :name => "Location", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => accident.id, :name => "Compensation", :data_type => "Integer", :required => false)
    HrCategoryDetail.create(:hr_category_id => accident.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => accident.id, :name => "Date", :data_type => "Date", :required => false)

    desc "Creating HR Category Disciplinary Actions"
    disciplinary_actions = HrCategory.create(:category_name => "Disciplinary Actions")
    desc "Creating HR Category Details for Hr Category 'Disciplinary Actions'"
    HrCategoryDetail.create(:hr_category_id => disciplinary_actions.id, :name => "Memo", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => disciplinary_actions.id, :name => "Issued By", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => disciplinary_actions.id, :name => "Comments", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => disciplinary_actions.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => disciplinary_actions.id, :name => "Issued Date", :data_type => "Date", :required => false)

    desc "Creating HR Category Extracurricular Event"
    extracurricular_event = HrCategory.create(:category_name => "Extracurricular Event")
    desc "Creating HR Category Details for Hr Category 'Extracurricular Event'"
    HrCategoryDetail.create(:hr_category_id => extracurricular_event.id, :name => "Game/Activity", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => extracurricular_event.id, :name => "Event", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => extracurricular_event.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => extracurricular_event.id, :name => "From Date", :data_type => "Date", :required => false)
    HrCategoryDetail.create(:hr_category_id => extracurricular_event.id, :name => "To Date", :data_type => "Date", :required => false)

    desc "Creating HR Category Extracurricular Award"
    extracurricular_award = HrCategory.create(:category_name => "Extracurricular Award")
    desc "Creating HR Category Details for Hr Category 'Extracurricular Award'"
    HrCategoryDetail.create(:hr_category_id => extracurricular_award.id, :name => "Game/Activity", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => extracurricular_award.id, :name => "Award", :data_type => "String", :required => true)
    HrCategoryDetail.create(:hr_category_id => extracurricular_award.id, :name => "Remarks", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => extracurricular_award.id, :name => "Date", :data_type => "Date", :required => false)

    desc "Creating HR Category General"
    general = HrCategory.create(:category_name => "General")
    desc "Creating HR Category Details for Hr Category 'General'"
    HrCategoryDetail.create(:hr_category_id => general.id, :name => "Description", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => general.id, :name => "Details", :data_type => "String", :required => false)
    HrCategoryDetail.create(:hr_category_id => general.id, :name => "Date", :data_type => "Date", :required => false)
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :salary_head, :state, :attendance_configuration, :financial_institution, :classification_heading]
end
