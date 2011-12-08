namespace :bootstrap do
  desc "Add the default user"
  task :default_user => :environment do
    User.create( :username => 'admin', :password => 'default' )
  end


  desc "Run all bootstrapping tasks"
  task :all => [:default_user]
end
