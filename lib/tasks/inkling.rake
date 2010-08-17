namespace :inkling do

  desc "Create a default user with login 'admin' and password 'admin'"
  task :default_admin => [:environment] do
    user = Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")
    Inkling::RoleMembership.create!(:user => user, :role => Inkling::Role.find_by_name(Inkling::Role::ADMIN))
  end

  desc "Initializes inkling data."
  task :init => [:environment] do
    Inkling::Role.create!(:name => Inkling::Role::ADMIN)
    Rake::Task["inkling:default_admin"].execute
  end
end