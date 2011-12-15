namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create( :username => 'admin', :password => 'default' )
  end

  desc "Add Default Values"
  task :default_value => :environment do
    DefaultValue.create( :default_type => 'Salary Head', :value => 'Basic', :value_id => 1 )
    DefaultValue.create( :default_type => 'Salary Head', :value => 'DA', :value_id => 2 )
    DefaultValue.create( :default_type => 'Salary Head', :value => 'HRA', :value_id => 3 )
  end

  desc "Add Default Salary Heads"
  task :salary_head => :environment do
    SalaryHead.create( :head_name => 'Basic', :short_name => 'BASIC', :salary_type => "Earnings" )
    SalaryHead.create( :head_name => 'DA', :short_name => 'DA', :salary_type => "Earnings" )
    SalaryHead.create( :head_name => 'HRA', :short_name => 'HRA', :salary_type => "Earnings" )
  end



  desc "Run all bootstrapping tasks"
  task :all => [:default_user, :default_value, :salary_head]
end
