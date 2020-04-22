desc "Migrate plain text passwords to Bcrypt"
task :migrate_password => :environment do
  User.find_each do |user|
    user.password = user.password_plain
    user.password_confirmation = user.password_plain
    user.save
  end
end