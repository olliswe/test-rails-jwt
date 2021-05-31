desc "Add user profiles to exisiting users"

task :add_userprofile => :environment do
  users = User.all
  users.each do |user|
    if user.user_profile == nil
      user_profile = UserProfile.create!(first_name:'', last_name:'',age:user.age, user_id:user.id)
    end
  end
end