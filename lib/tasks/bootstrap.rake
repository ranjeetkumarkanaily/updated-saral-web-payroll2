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



  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :salary_head, :state, :attendance_configuration, :financial_institution]
end
