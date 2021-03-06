namespace :inkling do

  desc "Hard reset (caveat raker). Destroys db, recreates it, regenerates all migrations, migrates, and initializes with inkling data"
  task :rebuild => ["inkling:destroy_migrations", "inkling:generate", "db:drop", "db:create", "db:migrate", "inkling:init"]

  task :destroy_migrations do 
    system("rm -rf db/migrate/*")
  end
  
  task :generate do
    system("rails generate inkling")    
  end


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
  
  
  desc "Runs specs and cukes."
  task :megatest => [:environment, :spec, :cucumber]
end